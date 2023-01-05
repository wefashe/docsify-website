# Centos 7 mini 安装过程记录



## 网络配置

##### 1. 启用网络

```sh
cat /etc/sysconfig/network-scripts/ifcfg-xxx # 把最后一行修改为：ONBOOT=yes 
# ONBOOT 是否开机启动网卡，只有在激活状态的网卡才能去连接网络，进行网络通讯
# 重启网络服务，加载修改后的网卡配置
service network restart
```

![image-20210330171817365](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210330171819.png)

##### 2. NAT模式下配置静态IP

1. 查看虚拟机VMnet8网络的默认网关和子网掩码

   ![image-20210402153236774](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402153253.png)
   ![image-20210402153109038](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402153144.png)
   ![image-20210402153755446](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402153758.png)
   ![image-20210402154010863](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402154012.png)

2. 修改Linux的网络配置

      ```sh
      #编辑网卡配置  没有的参数在文件后面追加
      ip addr  #查看要修改的网卡
      vi /etc/sysconfig/network-scripts/ifcfg-xxx  # xxx为上面查询的网卡名
      ```

      其中主要的几处参数修改为：

       - `BOOTPROTO=static` 设置为静态ip, dhcp 动态IP, none 无（不指定）
       - `ONBOOT=yes` 设置开机启动网卡
       -　`IPADDR` 设置服务器的IP   如 192.168.44.131
       -　`NETMASK` 子网掩码，与VM的NAT模式的一致（步骤1已查询） 如 255.255.255.0
       - `GATEWAY` 默认网关，同样与VM的NAT模式下一致(步骤1已查询) 如 192.168.44.2
       - `DNS1` 设置域名解析服务器，可以与gateway相同，也可以为8.8.8.8等等

      ![image-20210331103210166](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210331103213.png)

      注意：如果是在内网环境，必须要配上主机内网环境的DNS，这样才能连通外网，内网DNS可能解析的ip不多，最好加上一个其他的DNS，这样才能域名和ip都能连通

      ![image-20210719164846510](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210719164846.png)

      免费的DNS

      114.114.114.114是国内移动、电信和联通通用的DNS，解析成功率相对来说更高，国内用户使用的比较多，速度相对快、稳定，是国内用户上网常用的DNS

      8.8.8.8和8.8.4.4是GOOGLE公司提供的DNS，该地址是全球通用的，相对来说，更适合国外以及访问国外网站的用户使用。

      目前国内有不少的免费、安全而且无毒的DNS，常见的如百度提供的180.76.76.76、阿里提供的223.5.5.5和223.6.6.6

  3. 重启网络服务

         ```sh
         service network restart
         ```

  4. 校验检查网络服务

         ```sh
         # 通过ping，检查网络是否ok
         ping www.baidu.com
         #ifconfig或 ip addr查看是否跟设置的ip一样
         ```

##### 3. 主机与虚拟机互通

 1.  这时虚拟机应该可以ping通主机, 但主机ping不通虚拟机

     ```sh
     # 虚拟机ping主机
     ping 10.92.195.212
     ```

     ![image-20210402161707828](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402161711.png)

     ```sh
     # 主机ping虚拟机
     ping 192.168.44.131
     ```

     ![image-20210402161329102](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402161758.png)

	2. 主机ping通虚拟机设置

    ![image-20210402162215869](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402162217.png)

    ![image-20210402162311870](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402162316.png)

    ![image-20210402162424239](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402162425.png)

    ![image-20210402162955390](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402162957.png)

    ![image-20210402163209915](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402163211.png)

    ![image-20210402163420030](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210402163421.png)

## 配置阿里云yum源

```sh

# 备份原来的repo文件
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
# 检查是否安装wget
yum -y install wget
# 下载aliyun源  wget -O 指定下载后的文件名
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-`rpm -q --qf "%{version}" centos-release`.repo
#或
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-`rpm -q --qf "%{version}" centos-release`.repo

curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#执行yum源更新命令
yum clean all
yum makecache
yum update
#检查
yum repolist
```

## 下载常用软件

```sh
# net-tools 需要其中的ifconfig命令查看网络设置状态，以便之后设置固定ip
yum -y install net-tools 
```

```sh
# 为了免去每次开启 CentOS 时，都要手动开启  sshd 服务，可以将 sshd 服务添加至自启动列表中
systemctl enable sshd.service
# 检查  sshd  服务是否已经开启
ps -e | grep sshd
# 检查  22 号端口是否开启监听
netstat -an | grep 22  
```











## VMware完整克隆虚拟机后连不上网

![image-20210719173518247](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210719173748.png)

![image-20210719173847258](https://cdn.jsdelivr.net/gh/wefashe/git-images@master/images/20210719173847.png)





https://blog.csdn.net/mijichui2153/article/details/80918285
