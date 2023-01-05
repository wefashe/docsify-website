![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717125124.jpeg)

史上最浅显易懂的Git教程！

# 第1篇 Git是什么？

## 第1章 Git简介

Git是什么？  
Git是目前世界上最先进的分布式版本控制系统（没有之一），是大佬 Linus 在 2002 年花了两周时间用C写的一个分布式版本控制系统



[果壳中的 Git](https://github.com/geeeeeeeeek/git-recipes/wiki/1.1-%E6%9E%9C%E5%A3%B3%E4%B8%AD%E7%9A%84-Git)  
[Git简介](https://www.liaoxuefeng.com/wiki/896043488029600/896067008724000)

## 第2章 Git 与 SVN 区别

- 1、**Git 是分布式的，SVN 不是**：这是 Git 和其它非分布式的版本控制系统，例如 SVN，CVS 等，最核心的区别。

- 2、**Git 把内容按元数据方式存储，而 SVN 是按文件**：所有的资源控制系统都是把文件的元信息隐藏在一个类似 .svn、.cvs 等的文件夹里。

- 3、**Git 分支和 SVN 的分支不同**：分支在 SVN 中一点都不特别，其实它就是版本库中的另外一个目录。

- 4、**Git 没有一个全局的版本号，而 SVN 有**：目前为止这是跟 SVN 相比 Git 缺少的最大的一个特征。

- 5、**Git 的内容完整性要优于 SVN**：Git 的内容存储使用的是 SHA-1 哈希算法。这能确保代码内容的完整性，确保在遇到磁盘故障和网络问题时降低对版本库的破坏。

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717130406.jpeg)





# 第2篇 从零搭建本地代码仓库


## 第1章 安装配置

在使用Git前我们需要先安装 Git。Git 目前支持 Linux/Unix、Solaris、Mac和 Windows 平台上运行。

Git 各平台安装包下载地址为：http://git-scm.com/downloads

- Linux

- Mac

- Windows

  有个叫做 msysGit 的项目提供了安装包，可以到 GitHub 的页面上下载 exe 安装文件并运行：

  安装包下载地址：<https://gitforwindows.org>

  官网慢，可以用国内的镜像：<https://npm.taobao.org/mirrors/git-for-windows/>



Git 提供了一个叫做 git config 的工具，专门用来配置或读取相应的工作环境变量。

这些环境变量，决定了 Git 在各个环节的具体工作方式和行为。这些变量可以存放在以下三个不同的地方：

- `/etc/gitconfig` 文件：系统中对所有用户都普遍适用的配置。若使用 `git config` 时用 `--system` 选项，读写的就是这个文件。
- `~/.gitconfig` 文件：用户目录下的配置文件只适用于该用户。若使用 `git config` 时用 `--global` 选项，读写的就是这个文件。
- 当前项目的 Git 目录中的配置文件（也就是工作目录中的 `.git/config` 文件）：这里的配置仅仅针对当前项目有效。每一个级别的配置都会覆盖上层的相同配置，所以 `.git/config` 里的配置会覆盖 `/etc/gitconfig` 中的同名变量。

在 Windows 系统上，Git 会找寻用户主目录下的 .gitconfig 文件。主目录即 $HOME 变量指定的目录，一般都是 C:\Documents and Settings\$USER。

此外，Git 还会尝试找寻 /etc/gitconfig 文件，只不过看当初 Git 装在什么目录，就以此作为根目录来定位。

### 用户信息

配置个人的用户名称和电子邮件地址：

```bash
$ git config --global user.name "runoob"
$ git config --global user.email test@runoob.com
```

如果用了 **--global** 选项，那么更改的配置文件就是位于你用户主目录下的那个，以后你所有的项目都会默认使用这里配置的用户信息。

如果要在某个特定的项目中使用其他名字或者电邮，只要去掉 --global 选项重新配置即可，新的设定保存在当前项目的 .git/config 文件里。

### 文本编辑器

设置Git默认使用的文本编辑器, 一般可能会是 Vi 或者 Vim。如果你有其他偏好，比如 Emacs 的话，可以重新设置：:

```bash
$ git config --global core.editor emacs
```

### 差异分析工具

还有一个比较常用的是，在解决合并冲突时使用哪种差异分析工具。比如要改用 vimdiff 的话：

```bash
$ git config --global merge.tool vimdiff
```

Git 可以理解 kdiff3，tkdiff，meld，xxdiff，emerge，vimdiff，gvimdiff，ecmerge，和 opendiff 等合并工具的输出信息。

当然，你也可以指定使用自己开发的工具，具体怎么做可以参阅第七章。

### 查看配置信息

要检查已有的配置信息，可以使用 git config --list 命令：

```bash
$ git config --list
http.postbuffer=2M
user.name=runoob
user.email=test@runoob.com
```

有时候会看到重复的变量名，那就说明它们来自不同的配置文件（比如 /etc/gitconfig 和 ~/.gitconfig），不过最终 Git 实际采用的是最后一个。

这些配置我们也可以在 **~/.gitconfig** 或 **/etc/gitconfig** 看到，如下所示：

```bash
vim ~/.gitconfig 
```

显示内容如下所示：

```ini
[http]
    postBuffer = 2M
[user]
    name = runoob
    email = test@runoob.com
```

也可以直接查阅某个环境变量的设定，只要把特定的名字跟在后面即可，像这样：

```bash
$ git config user.name
runoob
```

## 第2章 工作流程

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717150145.png)



![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717150218.jpeg)



![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717151235.jpeg)





- workspace：工作区
- staging area：暂存区/缓存区
- local repository：版本库或本地仓库
- remote repository：远程仓库



![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210717151458.png)

## 第3章 基本操作

### 创建仓库

#### 创建仓库

`git init` 命令创建一个新的 Git 仓库。它用来将已存在但还没有版本控制的项目转换成一个 Git 仓库，或者创建一个空的新仓库。大多数Git命令在未初始化的仓库中都是无法使用的，所以这就是你运行新项目的第一个命令了。

运行 `git init` 命令会在你项目的根目录下创建一个新的 `.git` 目录，其中包含了你项目必需的所有元数据。除了 `.git` 目录之外，已经存在的项目不会被改变（就像 SVN 一样，Git 不强制每个子目录中都有一个 `.git` 目录）。

**用法**

```bash
git init
```

将当前的目录转换成一个 Git 仓库。它在当前的目录下增加了一个 `.git` 目录，于是就可以开始记录项目版本了。  `.git` 默认是隐藏的，可以用 ls -a 命令查看。

```bash
git init <directory>
```

在指定目录创建一个空的 Git 仓库。运行这个命令会创建一个名为 `directory`，只包含 `.git` 子目录的空目录。

```bash
git init --bare <directory>
```

初始化一个裸的 Git 仓库，但是忽略工作目录。共享的仓库应该总是用 `--bare` 标记创建（见下面的讨论）。一般来说，用 `—bare` 标记初始化的仓库以 `.git` 结尾。比如，一个叫`my-project`的仓库，它的空版本应该保存在 `my-project.git` 目录下。

**讨论**

和 SVN 相比，`git init` 命令是一个创建新的版本控制项目非常简单的途径。Git 不需要你创建仓库，导入文件，检查正在修改的拷贝。你只需要 `cd` 到你的项目目录下，运行 `git init`，你就有了一个功能强大的 Git 仓库。

但是，对大多数项目来说，`git init` 只需要在创建中央仓库时执行一次——开发者通常不会使用 `git init` 来创建他们的本地仓库。他们往往使用 `git clone` 来将已存在的仓库拷贝到他们的机器中去。

**裸仓库**

`-—bare` 标记创建了一个没有工作目录的仓库，这样我们在仓库中更改文件并且提交了。中央仓库应该总是创建成裸仓库，因为向非裸仓库推送分支有可能会覆盖已有的代码变动。将`-—bare`看成是用来将仓库标记为储存设施，而不是一个开发环境。也就是说，对于所有的 Git 工作流，中央仓库是裸仓库，开发者的本地仓库是非裸仓库。

**栗子**

因为 `git clone` 创建项目的本地拷贝更为方便，`git init` 最常见的使用情景就是用于创建中央仓库：

```bash
ssh <user>@<host>

cd path/above/repo

git init --bare my-project.git
```

首先，你用SSH连入存放中央仓库的服务器。然后，来到任何你想存放项目的地方，最后，使用 `-—bare` 标记来创建一个中央存储仓库。开发者会将 `my-project.git` 克隆到本地的开发环境中。

#### 克隆仓库

`git clone` 命令拷贝整个 Git 仓库。这个命令就像 `svn checkout` 一样，除了「工作副本」是一个完备的Git仓库——它包含自己的历史，管理自己的文件，以及环境和原仓库完全隔离。

为了方便起见，`clone` 自动创建了一个名为 `origin` 的远程连接，指向原有仓库。这让和中央仓库之间的交互更加简单。

**用法**

```bash
git clone <repo>
```

将位于 `<repo>` 的仓库克隆到本地机器的当前目录中。原仓库可以在本地文件系统中，或是通过 HTTP 或 SSH 连接的远程机器。

```bash
git clone <repo> <directory>
```

默认情况下，Git 会按照你提供的 URL 所指向的项目的名称创建你的本地项目目录。 通常就是该 URL 最后一个 / 之后的项目名称。如果你想要一个不一样的名字， 你可以在该命令后加上你想要的名称。这里就是将于 `<repo>` 仓库克隆到本地，命名为 `<directory>` 目录。

**讨论**

如果项目在远程仓库已经设置完毕，`git clone` 是用户获取开发副本最常见的方式。和 `git init`相似，`clone` 通常也是一次性的操作——只要开发者获得了一份工作副本，所有版本控制操作和协作管理都是在本地仓库中完成的。

**仓库间协作**

这一点很重要，你要理解 Git 中「工作副本」的概念和 SVN 仓库 check out 下来的「工作副本」是很不一样的。和 SVN 不同的是，Git 不会区分工作副本和中央仓库——它们都是功能完备的 Git 仓库。

这就使得 Git 的协作和 SVN 截然不同。SVN 依赖于中央仓库和工作副本之间的关系，而 Git 协作模型是基于仓库和仓库之间的交互的。相对于 SVN 的提交流程，你可以在 Git 仓库之间 `push` 或 `pull` 提交。

![img](https://camo.githubusercontent.com/14e667425e5aecb657c4f7ae41a69abefa813d7d8b1c99c5b787c0b5c0af6e6d/68747470733a2f2f7777772e61746c61737369616e2e636f6d2f6769742f696d616765732f7475746f7269616c732f67657474696e672d737461727465642f73657474696e672d75702d612d7265706f7369746f72792f30332e737667)

![img](https://camo.githubusercontent.com/546b1057f0a8112be89c4d09f30c12a8f0819139b1895929b507c64e8608b633/68747470733a2f2f7777772e61746c61737369616e2e636f6d2f6769742f696d616765732f7475746f7269616c732f67657474696e672d737461727465642f73657474696e672d75702d612d7265706f7369746f72792f30322e737667)

当然，你也完全可以给予某个特定的仓库一些特殊的含义。比如，指定某个 Git 仓库为中央仓库，你就可以用 Git 进行中央化的工作流。重点是，这是通过约定实现的，而不是写死在版本控制系统本身。

### 栗子

下面这个例子演示用 SSH 用户名 john 连接到 example.com，获取远程服务器上中央仓库的本地副本：

```bash
git clone ssh://john@example.com/path/to/my-project.git

cd my-project

# 开始工作
```

第一行命令在本地机器的 `my-project` 目录下初始化了一个新的 Git 仓库，并且导入了中央仓库中的文件。接下来，你 `cd` 到项目目录，开始编辑文件、缓存提交、和其它仓库交互。同时注意 `.git` 拓展名克隆时会被去除。它表明了本地副本的非裸状态。

### 仓库配置

`git config` 命令允许你在命令行中配置你的 Git 安装（或是一个独立仓库）。这个命令定义了所有配置，从用户信息到仓库行为等等。一些常见的配置命令如下所列。

**用法**

```bash
git config user.name <name>
git config user.email <email>
```

定义当前仓库所有提交使用的作者姓名邮箱。通常来说，会使用 `--global` 标记设置当前系统用户的全局配置项。

```bash
git config --global user.name <name>
git config --global user.email <email>
```

定义当前系统用户所有提交使用的作者姓名邮箱。

```
git config --global alias.<alias-name> <git-command> 删除
```

为Git命令创建一个快捷方式（别名）。

```bash
git config --system core.editor <editor>
```

定义当前机器所有用户使用命令时用到的文本编辑器，如 `git commit`。`<editor>` 参数用编辑器的启动命令（如 vi）替代。

```
git config --global --edit
```

用文本编辑器打开全局配置文件，手动编辑。

**讨论**

所有配置项都储存在纯文本文件中，所以 `git config` 命令其实只是一个提供便捷的命令行接口。通常，你只需要在新机器上配置一次 Git 安装，以及，你通常会想要使用 `--global` 标记。

Git 将配置项保存在三个单独的文件中，允许你分别对单个仓库、用户和整个系统设置。

- /.git/config – 特定仓库的设置。
- ~/.gitconfig – 特定用户的设置。这也是 `--global` 标记的设置项存放的位置。
- $(prefix)/etc/gitconfig – 系统层面的设置。

当这些文件中的配置项冲突时，本地仓库设置覆盖用户设置，用户设置覆盖系统设置。如果你打开期中一份文件，你会看到下面这些：

```ini
[user]

name = John Smith

email = john@example.com

[alias]

st = status

co = checkout

br = branch

up = rebase

ci = commit

[core]

editor = vim
```

你可以用 `git config` 手动编辑这些值。

### 栗子

你在安装 Git 之后想要做的第一件事是告诉它你的名字和邮箱，个性化一些默认设置。一般初始的设置过程看上去是这样的：

```bash
# 告诉Git你是谁

git config --global user.name "John Smith"

git config --global user.email john@example.com

# 选择你喜欢的文本编辑器

git config --global core.editor vim

# 添加一些快捷方式(别名)

git config --global alias.st status

git config --global alias.co checkout

git config --global alias.br branch

git config --global alias.up rebase

git config --global alias.ci commit
```

它会生成上一节中所说的 `~/.gitconfig` 文件。

- ### 忽略文件

- ### 远程操作

  - #### 添加远程仓库

  - #### 远程拉取变动

  - #### 远程拉取合并

  - #### 推送远程合并

### 提交修改

#### 添加文件

`git add` 命令将工作目录中的变化添加到缓存区。它告诉 Git 你希望下一个提交中包含这个文件的更新。不过，`git add` 不会实际上并不会改变你的仓库。直到你运行 `git commit` ，更改都没有真正被记录。

使用这些命令的同时，你还需要 `git status` 来查看工作目录和缓存区的状态。

**工作原理**

`git add` 和 `git commit` 这两个命令组成了最基本的 Git 工作流。它们的作用是将项目的诸多版本记录到仓库历史中。不管使用哪种团队协作模型，每个 Git 用户都必须理解这两个命令。

一个项目的编写离不开这个基本模式：编辑、缓存和提交。首先，你在工作目录下编辑你的文件。当你想要备份当前的项目状态时，你使用 `git add` 缓存更改。当你觉得这个被缓存的副本已经就绪，你使用 `git commit` 将它提交到项目历史。`git reset` 命令用于撤销提交或被缓存的快照。

除了 `git add` 和 `git commit` 之外，`git push` 也是完整的 Git 协作流程中的重要一环。`git push` 用于将提交的更改发送到远端仓库。随后，其它团队成员也可以看到这些更改。

![Git Tutorial: git add Snapshot](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210719092438.svg+xml;charset=UTF-8)

`git add` 命令和 `svn add` 不同。后者直接将**文件**添加到仓库中，而 `git add` 作用于更抽象的**更改**（更低一层）。也就是说，哪怕对于同一个文件，每次修改时你都需要使用 `git add` ，而 `svn add` 只需要使用一次。这听上去多此一举，但却使项目更易于管理。

**缓存区**

`git add` 命令最主要的作用是将工作目录中的更改添加到 Git 的缓存区。缓存区是 Git 特有的功能之一，如果你之前使用的是 SVN（甚至是更古老的 Mercurial），那你可得花点时间理解了。你可以把它理解成工作目录和项目历史中间的缓冲区。缓存区是 Git 三个树状文件结构之一，另外两个是工作目录和提交历史。

缓存允许你把紧密相关的几份更改合并成一份快照，而不是直接提交所有新的更改。也就是说你可以同时进行多个无关的更改，最后分成几次将相关更改添加到缓存区并提交。对于任何版本控制系统来说，保持提交的原子性非常重要，这有利于追踪 bug 以及用最小的代价撤销更改。

**用法**

```bash
git add <文件>
```

缓存 `<文件>` 中的更改，准备下次提交。

```bash
git add <目录>
```

缓存 `<目录>` 下的所有更改，准备下次提交。

```bash
git add -p
```

开始交互式的缓存。你可以将某个文件的其中一处更改加入到下次提交缓存。Git 会显示一系列更改，并等待用户命令。使用 `y` 缓存某一处更改，使用 `n` 忽略某一处更改，使用 `s` 将某一处分割成更小的几份，使用 `e` 手动编辑某一处更改，使用 `q` 退出编辑。

**栗子**

对于新项目来说，`git add` 和 `svn import` 的作用类似。使用下面两个命令为当前目录创建首个提交：

```bash
git add .
git commit
```

项目设置好之后，新的文件可以通过路径传递给 `git add` 来添加到缓存区：

```bash
git add hello.py
git commit
```

#### 提交文件

#### 回退版本

#### 撤销修改

#### 删除文件

#### 修改文件

#### 查看状态

#### 比较文件

- ### 查看日志

  - #### 查看提交记录

  - #### 查看修改记录

- ### 分支管理

  - #### 创建分支

  - #### 列出分支

  - #### 切换分支

  - #### 分支合并

  - #### 合并冲突

  - #### 推送分支

  - #### 删除分支

  - #### 管理策略

- ### 标签管理

  - #### 创建标签

  - #### 推送标签

  - #### 删除标签

- ### 配置别名

- #### Git服务器

## 第四章 界面工具

- Github
- Gitee
- GitLab
- gogs
- [SourceTree](https://www.sourcetreeapp.com/)
- Git GUI

# 第3篇 远程团队协作和管理



# 第4篇 Git 命令详解

# 第5篇 Git 实用贴士















[Git教程 - 廖雪峰官方网站](https://www.liaoxuefeng.com/wiki/896043488029600)

[高质量的 Git 中文教程 | Github](https://github.com/geeeeeeeeek/git-recipes)

[ Git 教程 | 菜鸟教程 ](https://www.runoob.com/git/git-tutorial.html)

https://gitee.com/ineo6/hosts

https://brew.idayer.com/
