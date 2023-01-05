# Java基础





## SpringBoot中异步请求和异步调用

###  SpringBoot中异步请求

**1、异步请求与同步请求**



![SpringBoot中异步请求和异步调用（看这一篇就够了）](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210520162423.png)

**特点：**

可以先释放容器分配给请求的线程与相关资源，减轻系统负担，释放了容器所分配线程的请求，其响应将被延后，可以在耗时处理完成（例如长时间的运算）时再对客户端进行响应。

一句话：**增加了服务器对客户端请求的吞吐量**（实际生产上我们用的比较少，如果并发请求量很大的情况下，我们会通过nginx把请求负载到集群服务的各个节点上来分摊请求压力，当然还可以通过消息队列来做请求的缓冲）。

**2、异步请求的实现**

**方式一：Servlet方式实现异步请求**

```java
@RequestMapping(value = "/email/servletReq", method = GET)
public void servletReq (HttpServletRequest request, HttpServletResponse response) {
    AsyncContext asyncContext = request.startAsync();
    //设置监听器:可设置其开始、完成、异常、超时等事件的回调处理
    asyncContext.addListener(new AsyncListener() {
        @Override
        public void onTimeout(AsyncEvent event) throws IOException {
            System.out.println("超时了...");
            //做一些超时后的相关操作...
        }
        @Override
        public void onStartAsync(AsyncEvent event) throws IOException {
            System.out.println("线程开始");
        }
        @Override
        public void onError(AsyncEvent event) throws IOException {
            System.out.println("发生错误："+event.getThrowable());
        }
        @Override
        public void onComplete(AsyncEvent event) throws IOException {
            System.out.println("执行完成");
            //这里可以做一些清理资源的操作...
        }
    });
    //设置超时时间
    asyncContext.setTimeout(20000);
    asyncContext.start(new Runnable() {
        @Override
        public void run() {
            try {
                Thread.sleep(10000);
                System.out.println("内部线程：" + Thread.currentThread().getName());
                asyncContext.getResponse().setCharacterEncoding("utf-8");
                asyncContext.getResponse().setContentType("text/html;charset=UTF-8");
                asyncContext.getResponse().getWriter().println("这是异步的请求返回");
            } catch (Exception e) {
                System.out.println("异常："+e);
            }
            //异步请求完成通知
            //此时整个请求才完成
            asyncContext.complete();
        }
    });
    //此时之类 request的线程连接已经释放了
    System.out.println("主线程：" + Thread.currentThread().getName());
}
```

**方式二：使用很简单，直接返回的参数包裹一层`callable`即可，可以继承`WebMvcConfigurerAdapter`类来设置默认线程池和超时处理**

```java
@RequestMapping(value = "/email/callableReq", method = GET)
@ResponseBody
public Callable<String> callableReq () {
    System.out.println("外部线程：" + Thread.currentThread().getName());

    return new Callable<String>() {
        @Override
        public String call() throws Exception {
            Thread.sleep(10000);
            System.out.println("内部线程：" + Thread.currentThread().getName());
            return "callable!";
        }
    };
}

@Configuration
public class RequestAsyncPoolConfig extends WebMvcConfigurerAdapter {

    @Resource
    private ThreadPoolTaskExecutor myThreadPoolTaskExecutor;

    @Override
    public void configureAsyncSupport(final AsyncSupportConfigurer configurer) {
        //处理 callable超时
        configurer.setDefaultTimeout(60*1000);
        configurer.setTaskExecutor(myThreadPoolTaskExecutor);
        configurer.registerCallableInterceptors(timeoutCallableProcessingInterceptor());
    }

    @Bean
    public TimeoutCallableProcessingInterceptor timeoutCallableProcessingInterceptor() {
        return new TimeoutCallableProcessingInterceptor();
    }
}
```

**方式三：和方式二差不多，在`Callable`外包一层，给`WebAsyncTask`设置一个超时回调，即可实现超时处理**

```java
@RequestMapping(value = "/email/webAsyncReq", method = GET)
@ResponseBody
public WebAsyncTask<String> webAsyncReq () {
    System.out.println("外部线程：" + Thread.currentThread().getName());
    Callable<String> result = () -> {
        System.out.println("内部线程开始：" + Thread.currentThread().getName());
        try {
            TimeUnit.SECONDS.sleep(4);
        } catch (Exception e) {
            // TODO: handle exception
        }
        logger.info("副线程返回");
        System.out.println("内部线程返回：" + Thread.currentThread().getName());
        return "success";
    };
    WebAsyncTask<String> wat = new WebAsyncTask<String>(3000L, result);
    wat.onTimeout(new Callable<String>() {

        @Override
        public String call() throws Exception {
            // TODO Auto-generated method stub
            return "超时";
        }
    });
    return wat;
}
```

**方式四：`DeferredResult`可以处理一些相对复杂一些的业务逻辑，最主要还是可以在另一个线程里面进行业务处理及返回，即可在两个完全不相干的线程间的通信。**

```java
@RequestMapping(value = "/email/deferredResultReq", method = GET)
@ResponseBody
public DeferredResult<String> deferredResultReq () {
    System.out.println("外部线程：" + Thread.currentThread().getName());
    //设置超时时间
    DeferredResult<String> result = new DeferredResult<String>(60*1000L);
    //处理超时事件 采用委托机制
    result.onTimeout(new Runnable() {

        @Override
        public void run() {
            System.out.println("DeferredResult超时");
            result.setResult("超时了!");
        }
    });
    result.onCompletion(new Runnable() {

        @Override
        public void run() {
            //完成后
            System.out.println("调用完成");
        }
    });
    myThreadPoolTaskExecutor.execute(new Runnable() {

        @Override
        public void run() {
            //处理业务逻辑
            System.out.println("内部线程：" + Thread.currentThread().getName());
            //返回结果
            result.setResult("DeferredResult!!");
        }
    });
    return result;
}
```

### SpringBoot中异步调用

**1、介绍**

异步请求的处理。除了异步请求，一般上我们用的比较多的应该是异步调用。通常在开发过程中，会遇到一个方法是和实际业务无关的，没有紧密性的。比如记录日志信息等业务。这个时候正常就是启一个新线程去做一些业务处理，让主线程异步的执行其他业务。

**2、使用方式（基于spring下）**

需要在启动类加入@EnableAsync使异步调用@Async注解生效

在需要异步执行的方法上加入此注解即可`@Async("threadPool")`,threadPool为自定义线程池

代码略。。。就俩标签，自己试一把就可以了

**3、注意事项**

在默认情况下，未设置`TaskExecutor`时，默认是使用`SimpleAsyncTaskExecutor`这个线程池，但此线程不是真正意义上的线程池，因为线程不重用，每次调用都会创建一个新的线程。可通过控制台日志输出可以看出，每次输出线程名都是递增的。所以最好我们来自定义一个线程池。

调用的异步方法，不能为同一个类的方法（包括同一个类的内部类），简单来说，因为Spring在启动扫描时会为其创建一个代理类，而同类调用时，还是调用本身的代理类的，所以和平常调用是一样的。

其他的注解如`@Cache`等也是一样的道理，说白了，就是Spring的代理机制造成的。所以在开发中，最好把异步服务单独抽出一个类来管理。下面会重点讲述。

**4、什么情况下会导致`@Async`异步方法会失效？**

a.调用同一个类下注有`@Async`异步方法：在spring中像`@Async`和`@Transactional`、`cache`等注解本质使用的是动态代理，其实Spring容器在初始化的时候Spring容器会将含有AOP注解的类对象“替换”为代理对象（简单这么理解），那么注解失效的原因就很明显了，就是因为调用方法的是对象本身而不是代理对象，因为没有经过Spring容器，那么解决方法也会沿着这个思路来解决。

b.调用的是静态(`static` )方法

c.调用(`private`)私有化方法

**5、解决4中问题1的方式（其它2,3两个问题自己注意下就可以了）**

将要异步执行的方法单独抽取成一个类，原理就是当你把执行异步的方法单独抽取成一个类的时候，这个类肯定是被Spring管理的，其他Spring组件需要调用的时候肯定会注入进去，这时候实际上注入进去的就是代理类了。

其实我们的注入对象都是从Spring容器中给当前Spring组件进行成员变量的赋值，由于某些类使用了`AOP`注解，那么实际上在Spring容器中实际存在的是它的代理对象。那么我们就可以通过上下文获取自己的代理对象调用异步方法。

```java
@Controller
@RequestMapping("/app")
public class EmailController {
    //获取ApplicationContext对象方式有多种,这种最简单,其它的大家自行了解一下
    @Autowired
    private ApplicationContext applicationContext;

    @RequestMapping(value = "/email/asyncCall", method = GET)
    @ResponseBody
    public Map<String, Object> asyncCall () {
        Map<String, Object> resMap = new HashMap<String, Object>();
        try{
            //这样调用同类下的异步方法是不起作用的
            //this.testAsyncTask();
            //通过上下文获取自己的代理对象调用异步方法
            EmailController emailController = (EmailController)applicationContext.getBean(EmailController.class);
            emailController.testAsyncTask();
            resMap.put("code",200);
        }catch (Exception e) {
            resMap.put("code",400);
            logger.error("error!",e);
        }
        return resMap;
    }

    //注意一定是public,且是非static方法
    @Async
    public void testAsyncTask() throws InterruptedException {
        Thread.sleep(10000);
        System.out.println("异步任务执行完成！");
    }
}
```

**6、开启cglib代理，手动获取Spring代理类,从而调用同类下的异步方法。**

首先，在启动类上加上`@EnableAspectJAutoProxy(exposeProxy = true)`注解。

代码实现，如下：

```java
@Service
@Transactional(value = "transactionManager", readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
public class EmailService {
    @Autowired
    private ApplicationContext applicationContext;

    @Async
    public void testSyncTask() throws InterruptedException {
        Thread.sleep(10000);
        System.out.println("异步任务执行完成！");
    }

    public void asyncCallTwo() throws InterruptedException {
        //this.testSyncTask();
//        EmailService emailService = (EmailService)applicationContext.getBean(EmailService.class);
//        emailService.testSyncTask();
        boolean isAop = AopUtils.isAopProxy(EmailController.class);//是否是代理对象；
        boolean isCglib = AopUtils.isCglibProxy(EmailController.class);  //是否是CGLIB方式的代理对象；
        boolean isJdk = AopUtils.isJdkDynamicProxy(EmailController.class);  //是否是JDK动态代理方式的代理对象；
        //以下才是重点!!!
        EmailService emailService = (EmailService)applicationContext.getBean(EmailService.class);
        EmailService proxy = (EmailService) AopContext.currentProxy();
        System.out.println(emailService == proxy ? true : false);
        proxy.testSyncTask();
        System.out.println("end!!!");
    }
}
```

### 异步请求与异步调用的区别

两者的使用场景不同，异步请求用来解决并发请求对服务器造成的压力，从而提高对请求的吞吐量；而异步调用是用来做一些非主线流程且不需要实时计算和响应的任务，比如同步日志到kafka中做日志分析等。

异步请求是会一直等待response相应的，需要返回结果给客户端的；而异步调用我们往往会马上返回给客户端响应，完成这次整个的请求，至于异步调用的任务后台自己慢慢跑就行，客户端不会关心。

## [Feign请求头设置/传递问题(同步方法设置Header/异步方法设置Header)](https://www.write1bug.cn/archives/feign请求头设置问题同步异步)



我们都知道Feign其实也是通过HTTP请求来实现的通信
那么自然绕不开HTTP相关的东西，比如很多系统中权限校验都是通过Header中的参数来实现，需要将前端传过来的header转发到目标服务，这里主要记录一下关于Header的设置。

> 下面提到的同步/异步 只是记录一下遇到问题的情景， 异步方法的实现方式同样适用于同步方法

# 同步

## 同步方法一: 通过拦截器

这种方法是比较通用而且也比较常见的，通过实现Feign的RequestInterceptor接口，重写里面的apply方法，为RequestTemplate添加请求头信息

代码如下

```java
@Component
public class FeignClientsConfigurationCustom implements RequestInterceptor {
    @Override
    public void apply(RequestTemplate requestTemplate) {
	// 此种方式是线程安全的
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
	// 不为空时取出请求中的header 原封不动的设置到feign请求中
        if (null != attributes) {
            HttpServletRequest request = attributes.getRequest();
            if (null != request) {
		// 遍历设置 也可从request取出整个Header 写到RequestTemplate 中
                Enumeration<String> headerNames = request.getHeaderNames();
                if (headerNames != null) {
                    while (headerNames.hasMoreElements()) {
                        String name = headerNames.nextElement();
                        String values = request.getHeader(name);
                        requestTemplate.header(name, values);
                    }
                }
            }
        }
    }
}
```

完成上述代码之后 在FeignClient注解中加入 configuration = FeignClientsConfigurationCustom.class 即可
如

```java
@FeignClient(name = "testClient", configuration = FeignClientsConfigurationCustom.class)
public interface testServer{
}
```

## 同步方法二：@Headers注解

这种方法比较适用于一些不变的参数，如Content-Type等

```java
@FeignClient(name = "testClient", configuration = FeignClientsConfigurationCustom.class)
public interface testServer{

	@GetMapping("/test")
	@Headers({"Content-Type: application/json","Accept: application/json"})
	String test(@RequestParam String param);
}
```

# 异步

> 此处说的异步场景是通过Spring中的`@Async`实现的

如

```java
// 带有@Async注解，异步调用Feign
@Autowired
private TestService testService;

@GetMapping("/test")
public String test(){
	// 此方法是一个异步方法， 在该方法中调用了Feign服务
	testService.testMethod();
	return "Hello world!";
}
```

此时的业务场景是 前端向我发送一个服务，我异步地调用其他微服务的方法， 由于此方法执行耗时可能会比较长，而且对用户来说没有下一步操作，所以直接return掉，那么主线程因return而关闭，此时在刚刚的FeignConfig中就无法获取到请求头了。

[![image.png](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210520162252.png)](https://img.write1bug.cn/image/image_1594188115834.png)

如图所示，红色方框圈起来的地方都不为null，但是最终获取到的Header是一个空的Map。

所以**猜测是因为主线程退出触发了JVM的回收机制**。

那么此时的情况将是 **主线程已经退出，子线程没有执行完**

所以显然，此时不能通过这种方式传递Header了。

## 异步方法一：线程私有变量ThreadLocal。

既然无法直接通过获取HttpServletRequest来获取Header，那么可以稍微改造一下，在原来的基础上添加一个拦截器。
所有的请求过来的时候，在拦截器中将Header先取出来，然后设置到本线程私有的Map中。

原来的apply方法在提交请求的时候再通过ThreadLocal提供的remove方法，清除掉。

只要把对该Map的操作封装一个工具类，工具类中实现get/set方法即可。

其实这种方式就是换了一个地方保存请求头，因此实用性与便捷性都还可以。

> 代码与截图待补充

## 异步方法二：通过传参

该方式是在方法执行前，先将需要的参数取出来，比如我需要一个token 就在Header中取出token，需要一个Content-Type就取出Content-Type。

然后将取出来的值作为参数传递到待执行的方法中。

该方法所调用的Feign接口需要做一个改造，在参数中添加带有`@RequestHeader`的注解，该注解表示将变量放在请求头，而不是请求的参数或者请求体里面。

如

```java
@FeignClient(name = "testClient", configuration = FeignClientsConfigurationCustom.class)
public interface testServer{

	@GetMapping("/test")
	String test(@RequestParam String param,@RequestHeader String token);
}
```

> 代码与截图待补充

这种方法对于原来代码的改动较小，如果异步的场景比较少的话可以选择这种方法。
但是如果项目中用到了较多的异步方法，那么就需要异步方法一里面的**拦截器 + ThreadLocal + RequestInterceptor**了。