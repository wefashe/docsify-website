## Java中的进制问题

#### java中的常用进制

- 二进制

  范围是0~1，由0,1组成，在Java中以0b开头

- 八进制

  范围是0~7，由0,1,2,...,7组成，在Java中以0开头

- 十进制

  范围是0~0，由0,1,2,3,...,9组成。在Java中整数默认是十进制的

- 十六进制

  范围是0~f，由0,1,2,..,9,a,b,c,d,e,f（大小写均可），在Java中以0x开头



java提供了工具类来实现进制的转换

```java
// 十进制转换为二进制、八进制、十六进制
int num10 = 15; // 十进制写法
// 十进制转二进制
System.out.println(Integer.toBinaryString(num10)); // 输出 1111
// 十进制转八进制
System.out.println(Integer.toOctalString(num10)); // 输出 17
// 十进制转十六进制
System.out.println(Integer.toHexString(num10)); // 输出 f


// 二进制、八进制、十六进制转换为十进制
// 二进制、八进制、十六进制数字类型变量的数据在java中运行时会自动转换为十进制
int num2 = 0b1111; // 二进制写法
int num8 = 017; // 八进制写法
int num16 = 0xf; // 十六进制写法
System.out.println(Integer.parseInt("1111",2)); // 二进制字符串1111转换10进制
System.out.println(Integer.parseInt("17",8)); // 八进制字符串17转换10进制
System.out.println(Integer.parseInt("f",16)); // 十六进制字符串转换10进制


//其他进制互相转化可以先转换为十进制在进行转换
```



#### Java位运算符

Java 定义的位运算（bitwise operators ）直接对整数类型的位进行操作，这些整数类型包括long，int，short，char，and byte ，用于操作二进制。包括有“&，|，^，~，<<，>>，>>>”



| 运算符 | 运算                                   | 示例                           |
| ------ | :------------------------------------- | ------------------------------ |
| &      | 与运算   只有两个都是1，结果才是       | 6 & 3 = 2                      |
| \|     | 或运算   只要有一个1，结果就是1        | 6 \| 3 = 7                     |
| ^      | 异或运算   相同的为0，不同的为1        | 6 ^ 5 = 5                      |
| ~      | 反码   1就是0,0就是1                   | ~ 6 = -7                       |
| <<     | 左移   将二进制向左位移，右边填0       | 3 <<  2 = 12  3 \* 2 \* 2 = 12 |
| \>>    | 右移   将二进制向右位移，左边填符号位  | 3 >> 1 = 1  3 / 2 = 1          |
| \>>>   | 无符号右移   将二进制向右位移，左边填0 | 3 >>> 2 = 1  3 / 2 = 1         |

![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPLpg3oxGUibTZicaE4Sn2cjWB3XXggrr6hibQvxueNHaofbFC4Sibic3lQP4w/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPL1EPd4yIRRwSficBoawbTLOOv4V6DG61icCnRT3piae1Kxm4XFA4Kn1mRA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

 ![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPLyh81vWFLGOib2wk2DYyTsxMGsd5DqfC5NFLAexBFmwXlKS3EEjKsQuQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPLGicyGCtpBaB2HiaiaibdVopsrX4zEWBcYWAwj9Plr2Yb34fQjV5L3XibfBw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPLnT5DWau472M6dQwCD1WhQ6vMvLcpREtwA87ib7AOQ6ibbb5fxySOhRLQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

![img](https://mmbiz.qpic.cn/mmbiz_png/N8scgexEBuJib1waOUgqbPJwjAcwAeTPLiblOz5ibicfoA4cvxaomKP2ChRCicLbxiaPkshpgyTwibwTKPMqjAcLg7icDA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

 “&&”和“&”以及“||”和“|”的区别？

- 逻辑运算：
  - &&：如果前面的条件返回了false，后面不再判断；
  - &：所有的条件都要判断；
  - ||：如果前面的条件返回了true，后面不再判断；
  - |：所有的条件都要判断；
- 位运算：
  - &和|可以应用
  - &&和||不可以。

  if条件表达式中的每个条件并非一定要执行，则可以只使用&&、||，因为它们的效率更高。

  位运算符中的&、|、^ 可以用于逻辑运算

```java
// && 与  前后两个操作数必须都是true才返回true,否则返回false
boolean b1=(5<3)&&(4>5);
System.out.println("b1="+b1);

// & 不短路与
boolean b2=(5<3)&(4>5);
System.out.println("b2="+b2);

// 一般都用&& 短路  
// 原因：效率高

// || 或 只要两个操作数中有一个是true，就返回true，否则返回false
boolean b3=(2<3)||(4>5);
System.out.println("b3="+b3);

// | 不短路 或
boolean b4=(2<3)|(4>5);
System.out.println("b4="+b4);

// ! 非 ，如果操作数为true，返回false，否则，返回true
boolean b5=!(3<4);
System.out.println("b5="+b5);

// ^ 异或 ，当两个操作数不相同时返回true，返回false
boolean b6=(5>4)^(4>5);
System.out.println("b6="+b6);
```

