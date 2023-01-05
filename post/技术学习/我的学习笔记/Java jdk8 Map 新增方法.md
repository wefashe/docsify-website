### jdk8 Map新增方法学习



#### putIfAbsent()

```java
Map<String, String> map = new HashMap<String, String>();
map.putIfAbsent("k", "v");
```

等价于：（功能等价，效率并不等价）

```java
HashMap<String, String> map = new HashMap<String, String>();
if(!map.containsKey("k")) {
    map.put("k", "v");    
}
```

**key不存在才put，存在就跳过。**











#### merge()

```java
String key = "key";
Map<String, String> map = new HashMap<String, String>();
map.put(key, "v")
map.merge(k, "alue", (oldVal, newVal) -> oldVal + newVal);
```

等价于：

```java
String k = "key";
Map<String, Integer> map = new HashMap<String, Integer>();
map.put(key, "v")
String newVal = "alue";
if(map.containsKey(k)) {
    map.put(k, map.get(k) + newVal);
} else {
    map.put(k, newVal);
}
```

**如果key存在，则执行lambda表达式，表达式入参为`oldVal`和`newVal`(newVal即`merge()`的第二个参数)。表达式返回最终put的val。如果key不存在，则直接put`newVal`。**











#### compute()

```java
String k = "key";
Map<String, String> map = new HashMap<String, String>();
map.put(key, "v")
map.compute(k, (key, oldVal) -> oldVal + 1);
```

等价于

```java
map.put(k, func(k, map.get(k)));

public Integer func(String k, Integer oldVal) {
    return oldVal + 1;
}
```

**根据已知的 k v 算出新的v并put。
 注意：**如果无此key，那么oldVal为null，lambda中涉及到oldVal的计算会报空指针。
 源码和merge大同小异，就不放了。





#### computeIfAbsent()

```java
Map<String, String> map = new HashMap<String, String>();
map. computeIfAbsent("k", key -> key + "v");
```

等价于：（功能等价，效率并不等价）

```java
HashMap<String, String> map = new HashMap<String, String>();
if(!map.containsKey("k")) {
    map.put("k", "k"+"v");    
}
```

**key不存在才put，存在就跳过。**







#### computeIfPresent()



#### replace



#### replaceAll



#### remove

#### comparingByKey  **comparingByValue** 



#### getOrDefault

#### 参考：

https://www.jianshu.com/p/68e6b30410b0

http://blog.tanpeng.net/2017/07/13/map-compute/

https://my.oschina.net/u/563488/blog/3012931

https://irusist.github.io/2016/01/04/Java-8%E4%B9%8BMap%E6%96%B0%E5%A2%9E%E6%96%B9%E6%B3%95/



