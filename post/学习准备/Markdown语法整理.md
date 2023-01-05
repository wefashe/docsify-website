> Markdown是一种[轻量级标记语言](https://baike.baidu.com/item/轻量级标记语言/52671915)，创始人为约翰·格鲁伯（英语：John Gruber）。 它允许人们使用易读易写的[纯文本格式](https://baike.baidu.com/item/纯文本格式/9862288)编写文档，然后转换成有效的XHTML（或者HTML）文档。
> 
> 由于Markdown的轻量化、易读易写特性，并且对于图片，图表、数学式都有支持，许多网站都广泛使用Markdown来撰写帮助文档或是用于论坛上发表消息。

参考：https://editor.mdnice.com/

## 基础

### **1. 标题**

`Markdown`支持两种标题的语法，类`Setext`和类`Atx`形式。

#### 1.1 类`Atx`形式

类`atx`形式使用 `#` 数量表示标题的阶数，在行首插入 1 到 6 个 `#`，对应到标题 1 到 6 阶，例如：

```markdown
# 这是h1
## 这是h2   
### 这是h3   
#### 这是h4   
##### 这是h5   
###### 这是h6   
```

也可以选择「闭合」类`atx`样式的标题，在行尾加上`#`，而行尾的`#`数量也不用和开头一样（**行首的井字符数量决定标题的阶数**）

```markdown
# 这是 H1 #
## 这是 H2 ##
### 这是 H3 ######
```

#### 1.2 `HTML`标题标签

`Markdown`中支持使用`HTML`标签，可以使用`<h1>` ~ `<h6>` 标签

```html
<h1>这是h1<h1>
<h2>这是h2<h2>
<h3>这是h3<h3> 
<h4>这是h4<h4>
<h5>这是h5<h5>
<h6>这是h6<h6>
```

#### 1.3 类`Setext`形式

类`Setext`形式是使用底线的形式，利用 `=`（最高阶标题）和 `-`（第二阶标题），例如：

```markdown
这是h1
======
这是h2
------
```

任何数量的 = 和 - 都可以有效果。

> 这里需要注意一点，由于分割线也是 “----”， 因此在使用分割线时，一定要空一行，不然会把上方的文字识别为第二阶标题。原因会在后面的段落和换行中说到。

### **2. 段落**

#### 2.1 换行

1. 使用`HTML`语言换行标签： `<br>`。

2. 使用连续两个以上空格加回车。  当然也可以使用一个空行来表示重新开始一个段落。

#### 2.2 缩进

`Markdown`首行文字前面无论空多少空格都会被忽略，这就导致无法做到首行缩进。

1. 两个全角空格
   
   因为一个**全角空格**的宽度是整整一个汉字，输入两个全角空格正好是两个汉字的宽度。
   
   全角空格的输入方法为：一般的中文输入法都是按 <kbd>shift</kbd> + <kbd>space</kbd>，可以切换到**全角模式**下，输完后再次按  <kbd>shift</kbd> + <kbd>space</kbd>切换回正常输入状态。

2. 用特殊占位符
   
   使用特殊占位符，不同占位符所占空白是不一样大的。**注意后面的分号不能丢**。
   
   半角的空格（英文下使用）：`&ensp;` 或  `&#8194;`
   
   全角的空格（中文下使用）： `&emsp;` 或 `&#8195;`
   
   不断行的空格： `&nbsp;` 或 `&#160;`

#### 2.3 字体

- 斜体粗体
  
  `Markdown`  使用星号`*`或底线`_`作为标记强调字词的符号，中间不要带空格，你用什么符号开启标签，就要用什么符号结束，也可以使用`HTML`标签来实现。个人感觉还是`*`比较好用，因为它不区分全角半角且实现兼容性。
  
  ```markdown
  我是正常体
  *我是斜体*   _我是斜体_   <em>我是斜体</em>  <i>我是斜体</i>
  **我是粗体**   __我是粗体__   <strong>我是粗体</strong>
  ***我是斜体+粗体***   ___我是斜体+加粗体___   <em><strong>我是斜体+加粗体</string></em>
  ```

- 字体大小颜色
  
  `Markdown`是一种可以使用普通文本编辑器编写的标记语言，它本身是不支持修改字体、字号与颜色等功能的，需要使用内嵌的`HTML`来实现字体、字号和颜色编辑。
  
  ```html
  <font face="黑体">我是黑体字</font>
  <font face="微软雅黑">我是微软雅黑</font>
  <font face="STCAIYUN">我是华文彩云</font>
  <font color=hotpink size=1 face="黑体">hotpink颜色的字 黑体 大小1</font>
  <font color=#00ffff size=3>#00ffff颜色 大小3</font>
  <font color=orangered size=5 face="楷体">orangered颜色 大小5</font>
  
  <!--size：规定文本的尺寸大小。可能的值：从 1 到 7 的数字。浏览器默认值是 3-->
  ```
  
  输出：
  
  <font face="黑体">我是黑体字</font>  
  <font face="微软雅黑">我是微软雅黑</font>  
  <font face="STCAIYUN">我是华文彩云</font>  
  <font color=hotpink size=1 face="黑体">hotpink颜色的字 黑体 大小1</font>  
  <font color=#00ffff size=3>#00ffff颜色 大小3</font>  
  <font color=orangered size=5 face="楷体">orangered颜色 大小5</font>  
  
  另外，还可以这样设置字体颜色：

```markdown
$\color{green}{绿色}$
```

  输出： 

  $\color{green}{绿色} $

#### 2.4 对齐

对于标准的 `Markdown` 文本，默认左对齐，是不支持居中对齐和右对齐的。我们采用 `HTML` 语法格式

- 左对齐
  
  ```html
  <!-- 默认就是左对齐 -->
  <p align="left"> 左对齐left
  ```
  
  <p align="left"> 左对齐left

- 居中对齐
  
  ```html
  <p align="center"> 居中对齐align=center
  <!-- 或 -->
  <center> 居中对齐center标签 </center>
  ```
  
  <p align="center"> 居中对齐align=center
  <!-- 或 -->
  <center> 居中对齐center标签 </center>

- 右对齐
  
  ```html
  <p align="right"> 右对齐right
  ```
  
  <p align="right"> 右对齐right

#### 2.5 脚注

脚注是对文本的补充说明。`Markdown` 脚注的格式如下:

```markdown
在这段文字后添加一个脚注[^footnote].

[^footnote]:这里是脚注的内容.
```

效果演示：

在这段文字后添加一个脚注[^footnote].

[^footnote]:这里是脚注的内容.

> footnote 可以是任意英文字符；
> 脚注的内容可以放在文章的任意位置（一般放最后）。
> 
> 脚注显示在文章末尾；脚注后方的链接可以直接跳转回到加注的地方。

#### 2.6 背景色

`Markdown` 本身不支持背景色设置，需要借助 `table`、`tr`、`td` 等表格标签的 `bgcolor` 属性来实现背景色的功能。举例如下：

```html
<table><tr><td bgcolor=#FF4500>
    这里的背景色是：OrangeRed，十六进制颜色值：#FF4500，rgb(255, 69, 0)
</td></tr></table>
```

呈现效果如下：

<table><tr><td bgcolor=#FF4500>
    这里的背景色是：OrangeRed，十六进制颜色值：#FF4500，rgb(255, 69, 0)
</td></tr></table>

#### 2.7 分割线

可以在一行中用三个以上的星号`*`、减号`-`、底线`_`来建立一个分隔线，，中间可以插入空格，但行内不能有其他东西。

```markdown
***
* * *
---
- --
___
__ _
```

呈现效果如下：

***

> 在 [Typora](https://www.typora.io/) 中，文章开头的空行里：
> 
> `---Enter` 可快速配置 `YAML` 的 `Front Matter`；（文章开头不会用分割线，心中有数就行了）

#### 2.8 删除线

如果段落上的文字要添加删除线，只需要在文字的两端加上两个波浪线` ~~ `即可。

```2.8
我是正常文字
~~我是加删除线文字~~ 
```

~~我是加删除线文字~~ 

也可以使用`HTML`的`<del>`或`<s>`标签

```html
<del>我是加删除线的del标签</del>
<s>我是加删除线的s标签</s>
```

<del>我是加删除线的del标签</del>  
<s>我是加删除线的s标签</s>

#### 2.9 下划线

- 普通下划线
  
  标准的 `Markdown` 文本是不支持下划线的，我们可以通过 `HTML `的 `<u>`或`ins`标签来实现
  
  ```html
  <u>带下划线文本</u>
  或
  <ins>带下划线文本</ins>
  ```
  
  <u>带下划线文本</u> 

- 数学公式下划线
  
  ```markdown
  下划线 $\underline{X}$
  上划线 $\overline{X}$
  ```
  
  下划线 $\underline{X}$
  上划线 $\overline{X}$

- 自定义下划线
  
  可以使用 `HTML`的 `span` 标签、设置行内 `CSS` 的 `border-bottom` 属性来添加下划线。这种方式自定义程度最高。
  
  ```html
  <span style="border-bottom: 2px dashed red;">下划虚线</span>
  ```
  
  <span style="border-bottom: 2px dashed red;">下划虚线</span>
  
  其他下划线格式：
  
  ```html
  <span style="border-bottom: 1px solid red;">单下划线</span>
  
  <span style="border-bottom: thick double #32a1ce;">双下划线</span>
  
  <span style="border-bottom: 2px dotted red;">下划虚线</span>
  ```
  
  <span style="border-bottom: 1px solid red;">单下划线</span>
  
  <span style="border-bottom: thick double #32a1ce;">双下划线</span>
  
  <span style="border-bottom: 2px dotted red;">下划虚线</span>
  
  `Markdown` 无法表现中文的着重号 `．`，实在是没有办法的办法：
  
  ```html
  <span style="border-bottom: 8px dotted red;">假冒着重号</span>
  ```
  
  <span style="border-bottom: 8px dotted red;">假冒着重号</span>
  
  > 更多 `border-style` 参阅 [border-bottom - CSS_ Cascading Style Sheets _ MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom)。

#### 2.10 **上 下标**

```html
上标：O<sup>2</sup>
下标：H<sub>2</sub>O
最近文章<sup style="color:red;">*new*</sup>
```

上标：O<sup>2</sup>   
下标：H<sub>2</sub>O  
最近文章<sup style="color:red;">*new*</sup>

### **3. 列表**

`Markdown` 支持 **有序列表** 和 **无序列表**。

#### 3.1 无序列表

- `Mardown`符号实现
  
  使用星号 `*`、加号 `+` 或是减号 `-` 作为列表标记，标记符号后至少一个空格或制表符（Tab）。
  
  ```markdown
  * Green （比较推荐）
  - Red  （比较好用）
  + Blue
  ```
  
  * Green （比较推荐）
  - Red  （比较好用）
  + Blue
  
  无序列表标记符前**每增加 2 个空格或是 4 个空格或一个制表符（Tab），增加一个层级**：
  
  ```markdown
  - 伟大始于渺小。
    - 说和做是迥然不同的两回事。
        - 行动比语言更响亮。
  ```
  
  - 伟大始于渺小。
    - 说和做是迥然不同的两回事。
      - 行动比语言更响亮。

- `HTML`标签实现
  
  `HTML`中使用`<ul>`和`<li>`来实现
  
  ```html
  <ul>
      <li>Green</li>
      <li>Red</li>
      <li>Blue</li>
      <li>伟大始于渺小</li>
      <ul>
          <li>说和做是迥然不同的两回事</li>
          <ul>
              <li>行动比语言更响亮。</li>
          </ul>  
      </ul>  
  </ul>   
  ```
  
  <ul>
      <li>Green</li>
      <li>Red</li>
      <li>Blue</li>
      <li>伟大始于渺小</li>
      <ul>
          <li>说和做是迥然不同的两回事</li>
          <ul>
              <li>行动比语言更响亮。</li>
          </ul>  
      </ul>  
  </ul>

#### 3.2 有序列表

- `Mardown`符号实现
  
  则使用数字接着一个英文句点。标记符号后面也要接着**至少一个空格或制表符（Tab）**。
  
  ```markdown
  1. 有序第一行 
  2. 有序第二行
  3. 有序第三行
  4. 有序第四行
  ```
  
  1. 有序第一行 
  2. 有序第二行
  3. 有序第三行
  4. 有序第四行
  
  在列表标记上使用的数字并不会影响输出的 `HTML` 结果，这意味着，你可以 **Use lazy numbering for long lists**：
  
  ```markdown
  1. 有序第一行 
  1. 有序第二行
      1. 有序第三行
      1. 有序第四行
  1. 有序第五行
  ```
  
  1. 有序第一行 
  2. 有序第二行
     1. 有序第三行
     2. 有序第四行
  3. 有序第五行
  
  有序列表跟无序列表一样，标记符前**每增加 2 个空格或是 4 个空格或一个制表符（Tab），增加一个层级**：
  
  ```
  1. 他是猪吗？  
      1.1 是的，他情商太低
      1.2 不是，他智商很高
  2. 我是狗吗？
      2.1 是的，每天忙的累死累活(有序列表标记符号前有一个 Tab)
      2.2 不是，要求高累点我乐意
          2.2.1 不要想太多(有序列表标记符号前有两个 Tab)
          2.2.2 成功有方法
  ```
  
  1. 他是猪吗？  
      1.1 是的，他情商太低  
      1.2 不是，他智商很高  
  
  2. 我是狗吗？  
      2.1 是的，每天忙的累死累活(有序列表标记符号前有一个 Tab)  
      2.2 不是，要求高累点我乐意  
     
          2.2.1 不要想太多(有序列表标记符号前有两个 Tab)  
          2.2.2 成功有方法  

- `HTML`标签实现
  
  `HTML`中使用`<ol>`和`<li>`来实现
  
  ```html
  <ol>
      <li>Green</li>
      <li>Red</li>
      <li>Blue</li>
      <li>伟大始于渺小</li>
      <ul>
          <li>说和做是迥然不同的两回事</li>
          <ul>
              <li>行动比语言更响亮。</li>
          </ul>  
      </ul>  
  </ol>   
  ```
  
  <ol>
      <li>Green</li>
      <li>Red</li>
      <li>Blue</li>
      <li>伟大始于渺小</li>
      <ul>
          <li>说和做是迥然不同的两回事</li>
          <ul>
              <li>行动比语言更响亮。</li>
          </ul>  
      </ul>  
  </ol>

#### 3.3 列表中段落

列表项目可以包含多个段落，段落都必须缩进 4 个空格或是 1 个制表符（Tab）。

无序列表：

```
- Every man is his own worst enemy. Wisdom in the mind is better than money in the hand. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand.

    From small beginnings comes great things.(列表项目中的段落)

- Saying and doing are two different things. Actions speak louder than words. Saying and doing are two different things. Actions speak louder than words. 
```

- Every man is his own worst enemy. Wisdom in the mind is better than money in the hand. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand.
  
    From small beginnings comes great things.(列表项目中的段落)

- Saying and doing are two different things. Actions speak louder than words. Saying and doing are two different things. Actions speak louder than words. 

有序列表：

```
1. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand.

    From small beginnings comes great things. (列表项目中的段落)

2. Saying and doing are two different things. Actions speak louder than words. Saying and doing are two different things. Actions speak louder than words. 
```

1. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand. Every man is his own worst enemy. Wisdom in the mind is better than money in the hand.
   
    From small beginnings comes great things. (列表项目中的段落)

2. Saying and doing are two different things. Actions speak louder than words. Saying and doing are two different things. Actions speak louder than words. 

#### **3.4 列表内引用**

在引用标记符 `>` 前使用 2 / 4 个空格：

```
- A list item with a blockquote:

    > This is a blockquote（上面空一行，标记符 > 前有 1 个 Tab）
    > inside a list item.

1. A list item with a blockquote:

    > This is a blockquote（上面空一行，标记符 > 前有 4 个空格或者 1 个 Tab）
    > inside a list item.
```

- A list item with a blockquote:
  
  > This is a blockquote（上面空一行，标记符 > 前有 1 个 Tab）
  > inside a list item.
1. A list item with a blockquote:
   
   > This is a blockquote（上面空一行，标记符 > 前有 4 个空格或者 1 个 Tab）
   > inside a list item.

#### **3.5 列表内代码块**

要放代码块的话，中间空一行，然后缩进两次，也就是 8 个空格或者 2 个制表符（Tab）：

```
- 一列表项包含一个代码块：

        我是代码区块，我上方有一空行，前方有8个空格。

1. 一列表项包含一个代码块：

        我是代码区块，我上方有一空行，前方有8个空格。
```

- 一列表项包含一个代码块：
  
        我是代码区块，我上方有一空行，前方有8个空格。
1. 一列表项包含一个代码块：
   
        我是代码区块，我上方有一空行，前方有8个空格。

#### 3.6 **有序列表异常**

当然，项目列表很可能会不小心产生，像是下面这样的写法：

```markdown
   1. Sweet osmanthus smells ten miles.
1986. What a great season.
```

1986 头怎么伸出去了？要避免这样的状况，你可以在**句点前面加上反斜杠**。

```markdown
1986\. What a great season.
```

#### **3.7 任务列表**

代码：

```markdown
- [ ] a task list item
  - [x] completed
  - [ ] incomplete
- [ ] list syntax required
- [x] completed
```

显示效果：

- [ ] a task list item
  - [x] completed
  - [ ] incomplete
- [ ] list syntax required
- [x] completed

### **4. 区块**

- **区块引用**
  
  开头使用`>`符号 ，然后后面紧跟一个**空格**符号
  
  ```markdown
  > 引用一段内容
  ```

- **引用嵌套**
  
  只要根据层次加上不同数量的 `>` 。
  
  ```markdown
  >  请问 Markdown 怎么用？  -  小白
  >
  >>  自己看教程！  -  愤青
  >>  
  >>>  教程在哪？  -  小白
  >>  
  >>  我也不知道在哪！  -  愤青
  >
  >  那你回答个屁。  -  小白
  ```
  
  显示效果：
  
  >  请问 Markdown 怎么用？  -  小白
  > 
  > >  自己看教程！  -  愤青
  > 
  > > >  教程在哪？  -  小白
  > 
  > >  我也不知道在哪！  -  愤青
  > 
  >  那你回答个屁。  -  小白

- **引用其它要素**
  
  引用的区块内也可以使用其他的语法，包括标题、列表、代码区块等。
  
  ```markdown
  > 1.1 这是第一行列表项。
  > 
  >> 2.1 这是第二行列表项。
  >>
  >>- 这是无序列表项。
  >
  > #### 给出一些例子代码：
  > ```bash
  > return shell_exec("echo $input | $markdown_script");
  > ```
  ```
  
  显示效果：
  
  > 1.1 这是第一行列表项。
  > 
  > > 2.1 这是第二行列表项。
  > 
  > > - 这是无序列表项。
  > 
  > #### 给出一些例子代码：
  > 
  > ```bash
  > return shell_exec("echo $input | $markdown_script");
  > ```

- **引用内容换行**
  
  用法与段落换行一致。

### **5. 代码**

插入程序代码的方式有两种：使用反引号 `（~ 键）、使用缩进（Tab）。

- 插入行内代码，即插入一个单词或者一句代码的情况，使用 `code`  这样的形式插入。
- 插入多行代码，分别使用三个反引号（```）包裹多行代码。或者使用缩进。

**行内代码**

在一般的段落文字中，可以使用反引号 ` 来标记或插入代码区段。

```
C语言里的函数 `scanf()` 怎么使用？
```

C语言里的函数 `scanf()` 怎么使用？

当然也可以标记 `文件名` 、`关键词` 等。

 **多行代码**

- 在需要高亮的代码块的前一行及后一行使用三个反引号 ```（~ 键）
- 同时第一行反引号后面，输入代码块所使用的语言，实现代码高亮。

比如高亮 `python3` 代码块：

```markdown
```python
#!/usr/bin/env python3
print("Hello, World!");
​```
```

显示为：

```python
#!/usr/bin/env python3
print("Hello, World!");
```

 **缩进式插入多行代码**

> **注意**：
> 缩进式插入前方必须有空行；
> 缩进 4 个空格或是 1 个制表符；
> 一个代码区块会一直持续到没有缩进的那一行（或是文件结尾）。

代码：

```
此处有空行
    #include  <stdio.h>`
    int main(void)`
    {
        printf("Hello world\n");
    }
```

显示效果：

```
#include  <stdio.h>`
int main(void)`
{
    printf("Hello world\n");
}
```

**代码区块中的内容**

代码区块中，一般的 Markdown 语法不会被转换，像是 * 便只是星号，这表示你可以很容易地以 Markdown 语法撰写 Markdown 语法相关的文件。

```
```markdown
Markdown 语法展示
​```
```

比如下面展示 Markdown 常用语法：

```markdown
Markdown 目录：
[TOC]

Markdown 标题：
# 这是 H1
## 这是 H2
### 这是 H3

Markdown 列表：
- 列表项目
1. 列表项目

*斜体*或_斜体_
**粗体**
***加粗斜体***
~~删除线~~

Markdown 插入链接：
[链接文字](链接网址 "标题")

Markdown 插入图片：
![alt text](/path/to/img.jpg "Title")

Markdown 插入代码块：

    ```python
    #!/usr/bin/python3
    print("Hello, World!");
    ```

Markdown 引用：
> 引用内容

Markdown 分割线：
---

Markdown 换行：
<br>

Markdown 段首缩进：
  or &#8194; 表示一个半角的空格
  or &#8195;  表示一个全角的空格
   两个全角的空格（用的比较多）
  or &#160; 不断行的空白格
```

### **6. 链接**

​    Markdown 支持两种形式的链接语法： **行内链接** 和 **参考链接**。

​    **行内形式**

链接文字都是用 `[方括号]` 来标记，使用 `(圆括号)` 来把文字转成链接。还可以为链接文字配个Title，当然 Title 属性是可选项，加不加看心情咯。

```php
[链接文字](链接网址 "标题")
This is an [example link](http://example.com/ "With a Title"). 
```

This is an [example link](http://example.com/).

[在 Typora 软件中，复制一个链接，选中文字按 ctrl-K 快速插入链接。]()

**参考形式**

为参考形式的链接定一个 `[name]` 方便我们在文章中多次引用（name 可以用字母、数字和空格，且不分大小写）。

```php
[链接文字][name]

[name]: link "Title"
```

举例：

```php
早饭后，我打开 [每日英语听力][1] 学习英语。遇到不懂的英语单词，我借助 [欧路在线词典][2] 
查看释义并加入生词本，方便使用 [客户端][3] 随时记忆单词。

[1]: https://dict.eudic.net/ting "每日英语听力"
[2]: https://dict.eudic.net/ "《欧路词典》在线版"
[3]: https://www.eudic.net/v4/en/app/eudic "《欧路词典》英语翻译软件"
```

早饭后，我打开 [每日英语听力][1] 学习英语。遇到不懂的英语单词，我借助 [欧路在线词典][2] 
查看释义并加入生词本，方便使用 [客户端][3] 随时记忆单词。

[1]: https://dict.eudic.net/ting "每日英语听力"
[2]: https://dict.eudic.net/ "《欧路词典》在线版"
[3]: https://www.eudic.net/v4/en/app/eudic "《欧路词典》英语翻译软件"

```php
一直用 [百度][bd]，当知道 [搜狗][s] 可以搜索微信和知乎时，我慢慢爱上了 [搜狗][s] 这个功能。
学术搜索还是用 [Google][g]。平时也会用 [Bing][b]，毕竟各有所长。

[G]: https://www.google.com/ "Google"
[BD]: https://www.baidu.com/ "Baidu Search"
[S]: https://www.sogou.com/ "Sogou"
[B]: https://cn.bing.com/ "Bing Search"
```

一直用 [百度][bd]，当知道 [搜狗][s] 可以搜索微信和知乎时，我慢慢爱上了 [搜狗][s] 这个功能。
学术搜索还是用 [Google][g]。平时也会用 [Bing][b]，毕竟各有所长。

[G]: https://www.google.com/ "Google"
[BD]: https://www.baidu.com/ "Baidu Search"
[S]: https://www.sogou.com/ "Sogou"
[B]: https://cn.bing.com/ "Bing Search"

1. 放在括号中的标签，其后紧跟一个冒号和至少一个空格（例如`[label]:`）。
2. 链接的URL，可以选择将其括在尖括号中。
3. 链接的可选标题，可以将其括在双引号，单引号或括号中。

```markdown
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle "Hobbit lifestyles"
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle 'Hobbit lifestyles'
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle (Hobbit lifestyles)
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> 'Hobbit lifestyles'
[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> (Hobbit lifestyles)
```

**自动链接**

Markdown 支持以比较简短的自动链接形式来处理网址和电子邮件信箱，只需用 `< >` 包起来，Markdown 就会自动把它转成链接。一般网址的链接文字就和链接地址一样，邮址的自动链接也很类似，例如：

```markdown
<http://example.com/>
<address@example.com>
```

<http://example.com/>
<address@example.com>

### **7. 图片**

​    图片的语法和链接很像。 alt text 是替换文本；alt 属性规定在图像无法显示时的替代文本。虽然 alt text 可以不填，但推荐还是填上。 Title 是可选项。

**行内形式**

```markdown
![alt text](/path/to/img.jpg "Title")
```

**参考形式**

```markdown
![alt text][id]

[id]: /path/to/img.jpg "Title"
```

 **插入互联网上图片**

(右键 copy 图片地址)

```php
我在我的笔记本上装了 openSUSE Leap: 
![opensuse-laptop](https://www.opensuse.org/build/images/opensuse-laptop.gif)
```

我在我的笔记本上装了 openSUSE Leap: 
![opensuse-laptop](https://www.opensuse.org/build/images/opensuse-laptop.gif)

在 Typora 软件中，复制图像的链接，选中文字按 ctrl-shift-I 快速插入图像。

尽管互联网上有大量资源，为了确保文章图片不丢失，同时避免侵权，尽量上传自己的图片。

 **控制图片的大小 对齐方式**

MarkDown 中显示图片的语法是 `![图片描述](图片地址)` 。但是有时候我们需要更改图片大小和位置。

**通过 img 标签控制宽高**

```markdown
<img src="http://pic15.photophoto.cn/20100615/0006019058815826_b.jpg"  height="330" width="495">
```

**通过 `<div>` 标签和 `align` 属性控制对齐方式**

单张图片：

```markdown
<div align=center>![alt text](/path/to/img.jpg "Title")
<div align=right>![alt text](/path/to/img.jpg "Title")
```

多张图片可以这样写：

```markdown
<div align="center">

<img src="http://pp.myapp.com/ma_pic2/0/shot_42391053_1_1488499316/550" height="330" width="190" >
<img src="http://pp.myapp.com/ma_pic2/0/shot_42391053_2_1488499316/550" height="330" width="190" >
<img src="http://pp.myapp.com/ma_pic2/0/shot_42391053_3_1488499316/550" height="330" width="190" >

 </div>
```

#### 其他属性

根据 MarkDown 编辑器解析语法的方式不同，有些编辑器还支持别的属性

比如在 img 标签中增加 style=“margin-left:45px” ，在 atom 中配合 GitHub MarkDown 有效。

甚至相同的 html 属性在不同的编辑器内展示效果也不一样。如果想传递一个 md 文件给别人的话， 尽量不要加别的 html 属性进去，最好是测试满意后转换为 pdf 格式发给对方。

> - [Markdown 中控制图片的大小 对齐方式](https://blog.csdn.net/sunsteam/article/details/73112787)
> - [Markdown-图片设置（大小，居中）](https://blog.csdn.net/qq_35451572/article/details/79443467)

### **8. 表格**

**语法说明**

- 第一行为表头，第二行分隔表头和主体部分，第三行开始每一行为一个表格行；
- 列与列之间用管道符 | 隔开。原生方式的表格每一行的两边也要有管道符；
- 第二行还可以为不同的列指定对齐方向。默认为左对齐，可以**使用冒号 : 来定义表格的对齐方式**。冒号在分隔符 - 右边右对齐，在两边居中。

**简单方式写表格**

```
学号|姓名|分数
-|:-:|-:
小明|男|75
小红|女|79
小陆|男|92
```

| 学号  | 姓名  | 分数  |
| --- |:---:| ---:|
| 小明  | 男   | 75  |
| 小红  | 女   | 79  |
| 小陆  | 男   | 92  |

**原生方式写表格**

```
|学号|姓名|分数|
|---|---|---|
|小明|男|75|
|小红|女|79|
|小陆|男|92|
```

| 学号  | 姓名  | 分数  |
| --- | --- | --- |
| 小明  | 男   | 75  |
| 小红  | 女   | 79  |
| 小陆  | 男   | 92  |

## 高级

### **HTML**

#### **锚点**

> 锚点是网页制作中的一种，又叫命名锚记。命名锚记像一个迅速定位器一样是一种页面内的超级链接，运用相当普遍。

`markdown` 语法中是不支持锚点的，但是它可以通过链接和标题来实现跳转。

1. `markdown`中的标题作为链接来实现跳转
   
   ```markdown
   [显示内容](#标题)
   [跳转到列表](#列表)
   ```
   
   或使用`HTML`的`<a>`标签来实现跳转
   
   ```html
   <a href= "列表">跳转到列表<a>
   ```
   
   <a href="#_123">跳转到列表<a>

#### **键盘按键**

`<kbd>` 标签定义键盘文本。HTML 键盘输入元素（`<kbd>`）用于表示用户输入，它将产生一个行内元素，以浏览器的默认 monospace 字体显示。

示例：

```html
Please press 
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> 
to re-render an MDN page.
```

输出：

Please press 
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> 
to re-render an MDN page.

> 参见 [**kbd** The Keyboard Input element - HTML_ Hypertext Markup Language](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/kbd)。

#### **添加注音**

```markdown
<ruby>
我<rp>（</rp><rt>wǒ</rt><rp>）</rp>
爱<rp>（</rp><rt>ài</rt><rp>）</rp>
你<rp>（</rp><rt>nǐ</rt><rp>）</rp>
中<rp>（</rp><rt>zhōng</rt><rp>）</rp>
国<rp>（</rp><rt>guó</rt><rp>）</rp>
</ruby>
```

输出：

<ruby>
我<rp>（</rp><rt>wǒ</rt><rp>）</rp>
爱<rp>（</rp><rt>ài</rt><rp>）</rp>
你<rp>（</rp><rt>nǐ</rt><rp>）</rp>
中<rp>（</rp><rt>zhōng</rt><rp>）</rp>
国<rp>（</rp><rt>guó</rt><rp>）</rp>
</ruby>

**ruby 语法说明**

- `<ruby>` — 用它将需要注释或注音标的文字内容包围住。
- `<rt>` — 这里面放置音标或注释，这个标记要跟在需要注释的文本后边。`rt` 里的文字，对于横向显示的文章，它会显示在上方。对于竖向显示的文字，它会显示到右边。
- `<rp>` — 这个标记是防备那些不支持 `ruby` 标记的浏览器，主要用来放置括弧。对于支持这个标记的浏览器，`rp` 标记的 CSS 样式是 `{display:none;}`，也就是不可见。

偷懒的写法：

```
<ruby>
我爱你中国<rt>wǒàinǐzhōngguó</rt>
</ruby>
```

<ruby>
我爱你中国<rt>wǒàinǐzhōngguó</rt>
</ruby>

其中带音标的字母可通过输入法中的特殊字符输入。也可查看 [符号大全-特殊符号](http://www.fhdq.net/) 中的汉语拼音部分。

> 参见 [HTML 拼音/音标注释标记 ruby 和它的子元素 rt/rp](https://blog.csdn.net/chs_jdmdr/article/details/51622360

#### **折叠内容**

HTML `<details>` 标签指定了用户可以根据需要打开和关闭的额外细节。

语法：

```
<details> <summary>Title</summary>
contents ...
</details>
```

内容里面可以嵌套使用 Markdown 语法和 HTML 语法。

效果：

<details> <summary>Title</summary>
contents ...
</details>

在博客园的 Markdown 中，`<details>` 标签前面不能为空，要有字符或者空格：

```
 <details> <summary>View Code</summary>
code ...
</details>
```

有的 Markdown 中，可能 `<summary>` 标签与正文间要空一行。比如：

```
<details> <summary>View Code</summary>

code ...

</details>
```

当然，有空行的话比较方便阅读源码。

#### **添加目录**

在文章摘要或者文章简介之后，填写 `[TOC]` 以显示全文内容的目录结构。

TOC 是 Table of Contents 的简写。

#### **音频**

音频文件可以用 HTML 的方式嵌入到 Markdown 中。

**使用 HTML5 `<audio>` 元素**

下面是一个将音频嵌入到 HTML 文档的例子。

```html
<audio src="/test/audio.ogg">
  你的浏览器不支持 audio 标签。
</audio>
```

src 属性可以设置为一个音频文件的 URL 或者本地文件的路径。

```html
<audio src="audio.mp3" preload="none" controls loop>
  你的浏览器不支持 audio 标签。
</audio>
```

这个例子的代码中使用了 HTML 的“audio”元素的一些属性：

- ‘‘controls’’ : 为网页中的音频显示标准的 HTML5 控制器。
- ‘‘loop’’ : 使音频自动重复播放。
- ‘‘preload’’ : 属性用来缓冲 audio 元素的大文件，有三个属性值可供设置：
  - “none” 不缓冲文件
  - “auto” 缓冲音频文件
  - “metadata” 仅仅缓冲文件的元数据

> 参阅 [HTML5 `` 元素](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/audio)，和 [使用 HTML5 音频和视频](https://developer.mozilla.org/zh-CN/docs/Web/Guide/HTML/Using_HTML5_audio_and_video)。

**在线音乐**

进入 [**网易云音乐**](https://music.163.com/#) 歌曲界面，点击光碟下方的生成外链播放器：

- `iframe`  插件版本 

```html
<!-- auto=1 自动播放-->
<iframe 
    frameborder="no" 
    border="0" 
    marginwidth="0" 
    marginheight="0" 
    width=330 
    height=86                                          
    src="//music.163.com/outchain/player?type=2&id=393695&auto=0&height=66">
</iframe>
```

<!-- auto=1 自动播放-->

<iframe 
    frameborder="no" 
    border="0" 
    marginwidth="0" 
    marginheight="0" 
    width=330 
    height=86                                          
    src="//music.163.com/outchain/player?type=2&id=393695&auto=0&height=66">
</iframe>

- `flash`插件版本
  
  ```html
  <!-- auto=1 自动播放-->
  <embed 
      src="//music.163.com/style/swf/widget.swf?sid=393695&type=2&auto=0&width=320&height=66"       
      width="340" 
      height="86"  
      allowNetworking="all">
  </embed>
  ```
  
  <!-- auto=1 自动播放-->
  
  <embed src="//music.163.com/style/swf/widget.swf?sid=393695&type=2&auto=0&width=320&height=66" width="340" height="86" allowNetworking="all"></embed>

#### **视频**

视频文件可以用 HTML 的方式嵌入到 Markdown 中。

**HTML5 `<video>` 元素**

原生仅支持播放 ogg/mp4/webm 格式。不支持播放 FLV 格式视频。

| Type       | Filename Extension |
| ---------- | ------------------ |
| video/ogg  | ogg /ogv /ogm      |
| video/webm | webm               |
| video/mp4  | mp4                |

在 HTML 中嵌入视频：

```html
<!-- autoplay="autoplay"自动播放 -->
<video src="http://v2v.cc/~j/theora_testsuite/320x240.ogg" controls>
  你的浏览器不支持 <code>video</code> 标签。
</video>
```

<video src="http://v2v.cc/~j/theora_testsuite/320x240.ogg" controls="" style="box-sizing: border-box; height: auto; max-width: 100%; display: block; width: 800px; max-height: 400px; margin: 2rem auto; padding: 0px; color: rgba(0, 0, 0, 0.8); font-family: &quot;noto sans cjk sc&quot;, &quot;noto sans&quot;, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"></video>

这个例子展示了一个带有回放控制器的可播放视频，视频来源于 Theora 网站。

然而，浏览器并不是都支持相同的[视频格式](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Supported_media_formats)，所以你可以在 `<source>` 元素里提供多个视频源，然后浏览器将会使用它所支持的第一个源。

```html
<video width="320" controls loop>
  <source src="myVideo.mp4" type="video/mp4">
  <source src="myVideo.webm" type="video/webm">
  <source src="myVideo.ogv" type="video/ogg" />
  <p>Your browser doesn't support HTML5 video. Here is
     a <a href="myVideo.mp4">link to the video</a> instead.</p>
</video>
```

属性：

- ‘‘controls’’ : 允许用户控制视频的播放，包括音量，跨帧，暂停/恢复播放。
- ‘‘width’’ : 视频显示区域的宽度，单位是CSS像素。
- ‘‘height’’ : 展示区域的高度，单位是CSS像素。
- ‘‘loop’’ : 布尔属性；指定后，会在视频结尾的地方，自动返回视频开始的地方。
- ‘‘src’’ : 要嵌到页面的视频的URL。可选；你也可以使用video块内的 `<source>` 元素来指定需要嵌到页面的视频。

> 参阅 [HTML5 `` 元素](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/video)， 和 [使用 HTML5 音频和视频](https://developer.mozilla.org/zh-CN/docs/Web/Guide/HTML/Using_HTML5_audio_and_video)。

**HTML 内联框架元素 `<iframe>`**

  `<iframe>` 能够将另一个 HTML 页面嵌入到当前页面中。

  嵌入网络视频：

```
<iframe 
    src="https://v.miaopai.com/iframe?scid=SvyHaHOczsp7B6ftW86oqMMz62-h5ai6~Fwp8A__"
    width="800" 
    height="450" 
    frameborder="0" 
    allowfullscreen>
</iframe>
```

<iframe  
    src="https://v.miaopai.com/iframe?scid=SvyHaHOczsp7B6ftW86oqMMz62-h5ai6~Fwp8A__"
    width="800" 
    height="450" 
    frameborder="0" 
    allowfullscreen>
</iframe>

> 参阅 [HTML 内联框架元素 (``)](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/iframe)

**嵌入线上视频**

举例：进入 [bilibili](https://www.bilibili.com) 网站，选择视频，点击视频下侧的 **分享** 按钮，点击 **嵌入代码** 粘贴到文档中，长宽可能需要调整下：

<iframe src="//player.bilibili.com/player.html?aid=887922017&bvid=BV1ZK4y1w79w&cid=335101594&page=1" scrolling="no" border="0"  width="800" height="700" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>

- #### **地图**
  
  ### 嵌入百度地图
  
  [百度地图 API 定制工具](http://api.map.baidu.com/lbsapi/creatmap/index.html)
  
  ```
  <iframe
      src="http://118.25.75.221/map2.html" 
      width="600" 
      height="300" 
      frameborder="0" 
      scrolling="no"></iframe>
  ```
  
  <iframe
      src="http://118.25.75.221/map2.html" 
      width="600" 
      height="300" 
      frameborder="0" 
      scrolling="no"></iframe>

- #### **特殊符号**
  
  特殊字符是相对于传统或常用的符号外，使用频率较少字符且难以直接输入的符号。比如数学符号；单位符号；[制表符](https://baike.baidu.com/item/制表符/7337607)等。
  
  **使用特殊符号**
  
  - [常用符号大全](http://www.fhdq.net/)
  - [Emoji](https://emojipedia.org/)
  
  如果不嫌麻烦，写作时可以灵活运用一些特殊符号，以增加文档的趣味性：
  
  常用排版： ▌▍◆★☆☁➤➜❤➊➋➌
  
  TodoList： ✅☑✓✔√☓☒✘ㄨ✕✖✗❌❎
  
  emoji：🌹🍀🌙🍂🍃🌷💎🔥⭐🍄🏆
  
  **使用 HTML 符号**
  
  - [HTML 支持的特殊符号：数学符号 / 希腊字母 / 其他](https://www.w3school.com.cn/tags/html_ref_symbols.html)
  
  HTML 符号也都可以用到 Markdown 中。比如：
  
  | 结果  | 描述                    | 实体名称      | 实体编号      |
  |:--- |:--------------------- |:--------- |:--------- |
  | ←   | left arrow            | `&larr;`  | `&#8592;` |
  | ↑   | up arrow              | `&uarr;`  | `&#8593;` |
  | →   | right arrow           | `&rarr;`  | `&#8594;` |
  | ↓   | down arrow            | `&darr;`  | `&#8595;` |
  | ↔   | left right arrow      | `&harr;`  | `&#8596;` |
  | ↵   | carriage return arrow | `&crarr;` | `&#8629;` |

### **转义**

​    如果要在文字前后直接插入普通的星号或底线，你可以用反斜线：

```
\*this text is surrounded by literal asterisks\*
```

*\*this text is surrounded by literal asterisks\**

Markdown 支持以下这些符号前面加上反斜杠来帮助插入普通的符号：

```html
\   反斜线
`   反引号
*   星号
_   底线
{}  花括号
[]  方括号
()  括弧
#   井字号
+   加号
-   减号
.   英文句点
!   惊叹号
```

### **公式**

当你需要在编辑器中插入数学公式时，可以使用两个美元符 `$$` 包裹 TeX 或 LaTeX 格式的数学公式来实现。如：

一个简单的数学公式，求圆的面积：

```
$$
S=\pi r^2
$$
```

$$
S=\pi r^2
$$

其他公式：

```
$$
x \href{why-equal.html}{=} y^2 + 1
$$
```

$$
x \href{why-equal.html}{=} y^2 + 1
$$

```
$$ 
x = {-b \pm \sqrt{b^2-4ac} \over 2a}. 
$$
```

$$
x = {-b \pm \sqrt{b^2-4ac} \over 2a}.
$$

```markdown
$$
\left [ – \frac{\hbar^2}{2 m} \frac{\partial^2}{\partial x^2} + V \right ] \Psi = i \hbar \frac{\partial}{\partial t} \Psi
$$
```

$$
\left [ – \frac{\hbar^2}{2 m} \frac{\partial^2}{\partial x^2} + V \right ] \Psi = i \hbar \frac{\partial}{\partial t} \Psi
$$

Alternatively, inline math can be written by wrapping the formula with only a single `$`:

```
This is inline: $\mathbf{y} = \mathbf{X}\boldsymbol\beta + \boldsymbol\varepsilon$
```

This is inline: $\mathbf{y} = \mathbf{X}\boldsymbol\beta + \boldsymbol\varepsilon$

Note that Markdown special characters need to be escaped with a backslash so they are treated as math rather than Markdown. For example, `*` and `_` become `\*` and `\_` respectively.

同时也支持 HTML 属性，如：

```
$$ 
(x+1)^2 = \class{hidden}{(x+1)(x+1)} 
$$

$$
(x+1)^2 = \cssId{step1}{\style{visibility:hidden}{(x+1)(x+1)}}
$$
```

$$
(x+1)^2 = \class{hidden}{(x+1)(x+1)}
$$

$$
(x+1)^2 = \cssId{step1}{\style{visibility:hidden}{(x+1)(x+1)}}
$$

>  [Markdown 之表格 & MathJax](https://zsweety.blog.csdn.net/article/details/78341085)

### 流程图

**横向流程图**

```
graph LR;
A[Hard edge] -->|Label| B(Round edge)
B --> C{Decision}
C -->|One| D[Result one]
C -->|Two| E[Result two]
```

graph LR;
A[Hard edge] -->|Label| B(Round edge)
B --> C{Decision}
C -->|One| D[Result one]
C -->|Two| E[Result two]

**纵向流程图**

```
graph TD;

A[christmas] -->B(Go shopping)

B --> C{Let me think}

C -->|One| D[Laptop]

C -->|Two| E[iPhone]

C -->|Three|F[Car]
```

graph TD;

A[christmas] -->B(Go shopping)

B --> C{Let me think}

C -->|One| D[Laptop]

C -->|Two| E[iPhone]

C -->|Three|F[Car]

**控制图**

```markdown
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```

**序列图**

```
sequenceDiagram

loop every day

Alice->>John: Hello John, how are you?

John-->> Alice: Great!

end
```

**甘特图**

```
gantt

dateFormat YYYY-MM-DD

title 产品计划表

section 初期阶段

明确需求: 2016-03-01, 10d

section 中期阶段

跟进开发: 2016-03-11, 15d

section 后期阶段

走查测试: 2016-03-20, 9d
```

> [有道云笔记 - Markdown 模板](https://blog.csdn.net/lzuacm/article/details/81107109)

### **技巧**

特殊html标签整理

<https://blog.csdn.net/enthan809882/article/details/107543174>

<https://www.w3school.com.cn/tags/tag_phrase_elements.asp>

<https://www.cnblogs.com/zuihongyan/p/5641130.html>

<https://blog.csdn.net/qq_28550263/article/details/112798688>

<https://blog.csdn.net/grace666/article/details/51874109>