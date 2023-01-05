

# Linux SSH 访问控制

Linux 系统SSH 登录失败的内容会记录到/var/log/secure文件，通过查找关键字 Failed，可以定位到这些异常的IP地址，比如：

![image-20210324102612460](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210324102624.png)

比如这里，明显这个IP地址在进行SSH 扫描，不断的更换端口和用户进行暴力测试。

在Linux里面有2个相关的文件：

#### /etc/hosts.allow： 允许哪些IP访问主机

```sh
#vi /etc/hosts.allow
sshd:171.34.164.172 #允许171.34.164.172进行远程连接，:allow可以省略
# echo "sshd:171.34.164.172" >> /etc/hosts.allow
```

#### /etc/hosts.deny 禁止哪些IP访问主机:

```sh
#vi /etc/hosts.deny
sshd: ALL  #表示拒绝了所有sshd远程连接。:deny可以省略
# echo "sshd:ALL" >> /etc/hosts.deny
```
ssh登陆时，先读取hosts.deny配置，在读取/etc/hosts.allow配置，hosts.allow配置优先于hosts.deny



#### 重启sshd服务

```sh
systemctl restart sshd

# 清除登陆认证信息
echo ""> /var/log/secure
```



Linux 向文件末尾追加内容命令

```sh
echo 'hello world' >> a.txt
```

Linux 覆盖文件内容命令

```sh
echo 'hello world' > a.txt
```

注意：>> 是追加   >是覆盖