#### MarkDown使用技巧

> 段内换行和段落之间

段落内的换行使用 2 个以上空格加上回车；也可以在段落后面使用一个空行来表示重新开始一个段落。

```text
这是第一段的第1行    <--末尾添加至少2个空格
这是第一段的第2行
(空行)
这是第二段
(空行)
这是第三段
```

这是第一段的第1行    <--末尾添加至少2个空格
这是第一段的第2行
(空行)
这是第二段
(空行)
这是第三段

> 字体

```markdown
*斜体文本*
_斜体文本_
**粗体文本**
__粗体文本__
***粗斜体文本***
___粗斜体文本___
```

*斜体文本*
_斜体文本_
**粗体文本**
__粗体文本__
***粗斜体文本***
___粗斜体文本___


> 字号及颜色

```html
<font size=1>大小为1的字体</font>
<font size=6>大小为6的字体</font>

<font color=gray size=4>gray颜色的字</font>
<font color=green size=4>green颜色的字</font>
<font color=hotpink size=4>hotpink颜色的字</font>
<font color=LightCoral size=4>LightCoral颜色的字</font>
<font color=LightSlateGray size=4>LightSlateGray颜色的字</font>
<font color=orangered size=4>orangered颜色的字</font>
<font color=red size=4>red颜色的字</font>
<font color=springgreen size=4>springgreen颜色的字</font>
<font color=Turquoise size=4>Turquoise颜色的字</font>
```

<font size=1>大小为1的字体</font>
<font size=6>大小为6的字体</font>

<font color=gray size=4>gray颜色的字</font>
<font color=green size=4>green颜色的字</font>
<font color=hotpink size=4>hotpink颜色的字</font>
<font color=LightCoral size=4>LightCoral颜色的字</font>
<font color=LightSlateGray size=4>LightSlateGray颜色的字</font>
<font color=orangered size=4>orangered颜色的字</font>
<font color=red size=4>red颜色的字</font>
<font color=springgreen size=4>springgreen颜色的字</font>
<font color=Turquoise size=4>Turquoise颜色的字</font>



> 部分文字标记高亮

**方案1 用等号标记高亮**

写法是这样 `周围的文字==高亮文字==周围的文字`

Typora 自带支持, 类比于其他软件的明黄色高亮, 可用 css 调整样式, 不太破坏原文

缺点: 就一种颜色, 没法跨段落, 没法对代码块的一小部分内容做标注

**方案2 内嵌 HTML 元素 span, 自己定义格式细节**

其实就是在 Markdown 里混合写 HTML, “遇到复杂格式用 HTML 来表示” 就是 md 的初衷

- 使用 style `<span style='color:red;background:#def;font-size:1.5rem;font-family:宋体;'>文字</span>`
- 类似的方法 `<span class="text-warning">`, 自定义`<myspan>xxx</myspan>` 等

灵活, 可以有多个颜色和样式

缺点: 文本的语义不清楚, 标记太多了扰乱文档

想兼容更多软件, 需要用 `style` 的办法, 在多种软件里都能保留样式

而 `class` 的办法在 Typora 中会过滤掉这些标记 (在 VSCode 中可以保留)



> 添加注记

**方案1 使用脚注**

简单好用, 跟周围文本风格统一

注意区分

```
1 普通链接 [an example](http://example.com/ "Title")

2 参考链接 (链接引用) [an example][id] 这个都是方括号

[id]: http://example.com/  "Optional Title Here"

3 脚注 [^footnote]

[^footnote]: 脚注内容可以使用**富文本**
```

缺点: 从语义上是给原作者用的, 不像是做笔记时的附注

**方案2 使用 md 扩展语法 Admonition**

参考 [VSCode Markdown Extended](https://marketplace.visualstudio.com/items?itemName=jebbs.markdown-extended#extended-syntaxes) 写法是

```
!!! note

    This is the **note** admonition body

    !!! danger Danger Title
        This is the **danger** admonition body   

!!! quote 自定义标题

    在 Admonition 中使用自定义标题

!!! snippet ""

    在 Admonition 中隐藏标题
```

需要 VSCode + 扩展 `Markdown Extended`, 启动 md 预览就能看到了

在 Typora 里虽然不识别, 也保留了相对易读的样式, 类似一个四空格缩进的代码块, 语义比较清楚

唯独有个小问题, Typora 输入四个空格缩进时, 它会在行首自动添加一个 `\u200b` 字符 ([u200b instead of tab](https://github.com/typora/typora-issues/issues/2039) 为让普通段落能具备首行缩进效果), 于是从 VSCode 看来, 就认不出这是一个 Admonition 块了, 解决办法: 在 Typora 中切换源代码模式, 删掉 `\u200b` 字符就行

另附 Admonition 所有支持的标记:

```
note | summary/abstract/tldr | info/todo | tip/hint | success/check/done | question/help/faq | warning/attention/caution | failure/fail/missing | danger/error/bug | example/snippet | quote/cite
```

**方案3 使用 md 扩展语法 markdown-it-container**

这个可以渲染嵌套的 div, 表达更复杂的结构

来源用法同上, 需要配套 bootstrap

```
::: alert alert-danger
这是一个警告
:::

::::: container
:::: row
::: col-xs-6 alert alert-success
success text
:::
::: col-xs-6 alert alert-info
warning text
:::
::::
:::::
```

过于繁琐, 有点像是一个 HTML 方言了, 用到的机会不多

恰当的使用颜色高亮 + 注记, 你的 Markdown 文档开始有一些学习笔记的样子了, 如果能做到 LiquidText 那样就更好了, 还需研究

> 引用本地文件

**方案1 `file://` 协议, 使用绝对路径**

即指向本地文档的一条超链接

```
[test](file://D:/Todo/Evernote/test.md)
```

这样写常见软件一般都能识别

存在的问题:

- 首先 `file://` 协议不能用相对路径
- 在 Typora 里点击这种链接, 无法直接打开 md 后缀, 打开其他格式和文件夹都 ok
- 如果路径里面有中文或空格等, 部分软件无法匹配到这个路径
- VSCode 无法打开文件夹, 打开各种文件都可以识别

**方案2 `@import`**

这个是导入而不是引用, 需要 VSCode + [插件 Markdown Preview Enhanced](https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/file-imports) 写法:

```
@import "你的文件"
或
<!-- @import "your_file" -->
```

会把指定文件导入到当前文档

支持常见文件格式, 比如导入 css 会追加样式, 导入 csv 会渲染为表格, 等等

**方案3 使用 Notable**

Notable 通过在 Front-Matter 里添加元数据来管理一系列 md 文档, 最开始吸引我的是 Notable 对标签的处理, 它的标签可以像文件夹那样分层, 于是分类的需求和标记的需求, 就用这种标签统一解决了

除此以外 Notable 对 md 互相链接也做了一些自己的设计, 见 [官方文档](https://cheatsheet.md/notable.pdf) 的 Deep Linking 部分

```
[Example](@note/Example.md)

[](@note/Example.md)

[[Title|Example.md]]

[[Example]]
```

以上四种语法, 都表示链接到另一个 md 文档 Example.md, 此外还可以链接到标签, 链接到搜索, 链接到附件等

但是, 不能链接到另一个 md 中的指定标题

### 指向另一个 Markdown 文本的指定位置

比如 OneNote 和 Notion 有这个功能, 文档中的每个段落都有自己的独特链接

在 Markdown 的编辑器和管理工具里, 暂时没找到这个的解决办法

Markdown 生成 HTML 之后, 倒是很好解决, 各种 md to site 工具都可以, 参考 [Markdown 拓展 Header Anchors VuePress](https://v1.vuepress.vuejs.org/zh/guide/markdown.html#header-anchors)

### 检索多个 Markdown 文件

Typora 里有同目录的文件内容搜索

各大支持 md 的笔记软件, 都提供了更强大的搜索, 面向程序员的 VSCode, VNote 之类当然更不用说了

自从 Everything v1.4 版本开始, 可以使用文件内容搜索, 语法 `content:`, 例如:

```
"D:\Path\to\Your\Notes\" content:匹配关键词
```

问题在于这两个没找到答案:

1. 搜索文字, 对中文友好, 可以模糊匹配, 有权重, 类似网络搜索引擎
2. 搜索网络时, 把本地的搜索结果添加到侧栏里 (参考印象笔记 - 剪藏)

还有这些需求, 没有也行, 能实现更好:

1. 需要关联笔记推荐
2. 汇总 / 提取 / 搜索自己的高亮和注记
3. 搜索 Markdown 图片上的文字 (参考印象笔记)