# centos的下载与安装

#### 下载地址

- 官网下载：https://www.centos.org/download/

- 国内镜像：https://mirrors.aliyun.com/centos/

### 版本介绍

- DVD：常规版本，推荐安装。里面包含大量的常用软件，没记错的话也包含了GUI（可以通过GUI选择部分包的安装）如如无特殊需求无需通过网络下载安装包（DVD镜像已经包含了）。
- Everything：包含了所有软件组件，主要提供给哪些无法通过网络安装的用户使用下载之后可以基于该镜像建立本地仓库镜像。
- LiveGNONE：Live*指那些可通过光盘直接启动的系统镜像，当然也可以安装，但有些包还是需要通过网络下载，LiveGNONE指包含GNONE桌面的live镜像。
- LiveKDE，这个和LiveGNONE不同在于GUI，KDE/GNONE喜欢那个选哪个，当然系统安装后可以手动重新安装、切换。
- Minimal：最小化安装版本，精简后的，一些软件在系统安装后需要手动安装，只包含一些必须的，类似telnet，curl之类的我记得这个里面好像都没有。
- NetInstall:这个是一个网络安装引导镜像，如果你网络速度快的话可以选择（当然同样最好选国内仓库镜像）；该镜像引导安装启动后从Centos远程仓库中拉取你选择的包，下载并安装。

### 安装选择

- https://mirrors.aliyun.com/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1908.iso