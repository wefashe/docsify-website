# Jenkins打包项目提示Docker的2375端口连接超时问题


Jenkins报错内容如下：

![image-20210324113549252](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113551.png)的博客，貌似需要改/usr/lib/systemd/system/docker.service文件，在ExecStart=/usr/bin/dockerd 后插入 -H tcp://0.0.0.0:2375，然后试着改了一下：

![image-20210324113618740](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113620.png)
修改之后，可以从docker的状态里面看到这个属性的值：

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113656.png)

然后试着在自己电脑访问：Docker IP:2375/version 仍然访问不通，这就很神奇了。

然后试着在服务器上使用：``curl http://服务器IP:2375/version`，就是正常的，返回了一个json串。

那么接着看下防火墙：

```sh

    #查看防火墙状态
    systemctl status firewalld
    #启动防火墙 没有提示
    systemctl start firewalld
    #添加2375端口
    firewall-cmd --permanent --zone=public --add-port=2375/tcp
    #防火墙重启
    firewall-cmd --reload
    #查看开放的端口
    firewall-cmd --permanent --zone=public --list-ports

```

防火墙是开着的，然后看下开放的端口，却发现是空的，那么就把2375加上试下，然后重启防火墙：

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113808.png)

这时再次访问，则外部电脑可以访问了。

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113837.png)

这里有个我不理解的地方，在开放防火墙端口的时候，使用的是2375/tcp,我还以为只是tcp可以访问了呢，结果外部电脑都可以访问了。

然后来看下Jenkins的配置里面：

![img](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324113854.png)Docker 

这个值刚好是我们之前配的Docker IP，是不是有点巧。

然后尝试再次构建，发现该异常已解决。