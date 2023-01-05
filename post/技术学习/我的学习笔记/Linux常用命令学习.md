### [Linux命令大全搜索工具](https://git.io/linux)

搜集了 ==570== 多个 `Linux` 命令，是一个非盈利性的仓库，生成了一个 web 网站方便使用，目前网站没有任何广告，内容包含 `Linux` 命令手册、详解、学习，内容来自网络和网友的补充，非常值得收藏的 `Linux` 命令速查手册



### tail

在屏幕上显示指定文件的末尾若干行，默认在屏幕上显示指定文件的末尾==10==行

`tail -25 message.log `  显示 message.log  最后的 25 行

`tail -f message.log `  显示最新出现的message.log 日志



### grep

强大的文本搜索工具， 它能使用正则表达式搜索文本，并把匹配的行打印出来

`grep error message.log ` 搜索出含有error的错误日志



### nohup

可以将程序以忽略挂起信号的方式运行起来，被运行的程序的输出信息将不会显示到终端

`nohup ping -c 10 baidu.com`  会在同一个目录下生成一个名称为 `nohup.out` 的文件，其中包含了正在运行的程序的输出内容

**注意**

`nohup`忽略==SIGHUP==信号, 关闭shell, 那么`nohup`后面的命令的进程还是存在的（对==SIGHUP==信号免疫），但是，如果你直接在shell中用`Ctrl C`, 那么进程也是会消失的（因为对==SIGINT==信号不免疫）。

可以结合`&`使用，`&`的意思是在后台运行当你在执行`ping -c 10 baidu.com &`的时候， 即使你用`Ctrl C`, 进程照样运行（因为对==SIGINT==信号免疫）。 但是要注意， 如果你直接关掉shell后， 那么进程同样消失。 可见， &的后台并不硬（因为对==SIGHUP==信号不免疫）。与`nohup`命令正好相反，结合使用则是真正的后台运行。



### 混合使用

`tail -100 |grep errormessage.log `  查看最后一百条日志中并过滤出包含error内容的