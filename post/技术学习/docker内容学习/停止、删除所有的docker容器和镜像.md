列出所有的容器 ID

`docker ps -aq`

停止所有的容器

`docker stop $(docker ps -aq)`

删除所有的容器

`docker rm $(docker ps -aq)`

删除所有的镜像
`docker rmi $(docker images -q)`

复制文件
`docker cp mycontainer:/opt/file.txt /opt/local/docker cp /opt/local/file.txt mycontainer:/opt/`


docker 1.13 中增加了``docker system prune`的命令，针对container、image可以使用`docker container prune`、`docker image prune`命令。

`docker image prune --force --all`或者``docker image prune -f -a` : 删除所有不使用的镜像
`docker container prune`: 删除所有停止的容器