#### 开启Docker的远程访问

首先需要开启docker远程访问功能，以便可以进行远程操作。

- #### CentOS 6

　　修改/etc/default/docker文件，重启后生效（service docker restart）。

```sh
# vi /etc/default/docker
DOCKER_OPTS="-H=unix:///var/run/docker.sock -H=0.0.0.0:2375"
```

- ####  CentOS 7

　　打开/usr/lib/systemd/system/docker.service文件，修改ExecStart这行。

```sh
# vi /usr/lib/systemd/system/docker.service
ExecStart=/usr/bin/dockerd  -H tcp://0.0.0.0:2375  -H unix:///var/run/docker.sock
```

　　重启后生效

```sh
  systemctl daemon-reload    
  systemctl restart docker.service
```

　　测试是否生效

```sh
# shell测试
curl http://127.0.0.1:2375/version
# 浏览器测试
http://119.45.155.151:2375/version
```

![image-20200927170534919](https://raw.githubusercontent.com/wefashe/git-images/master/images/20200927170535.png)

![image-20200927170438781](https://raw.githubusercontent.com/wefashe/git-images/master/images/20200927170446.png)



如果是云服务器还需配置安全组开放对应的端口



#### 新建Maven项目