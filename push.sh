#!/bin/bash
set -e

git config user.name "wefashe"
git config user.email wefashe@qq.com

# 同时提交多个仓库
git remote rm origin
git remote add origin git@github.com:wefashe/docsify-website.git
#git remote set-url --add origin https://github.com/wefashe/git-backup.git
#ssh -o ServerAliveInterval=60 wefashe@gitee.com
#git remote add origin git@gitee.com:wefashe/git-backup.git
# 还可以继续添加
# git remote set-url --add origin https://github.com/zkzong/mongodb.git

git add .

# 设置 git status utf-8编码
git config core.quotepath false
# 设置Git GUI界面utf-8编码
git config gui.encoding utf-8
# 设置commit信息utf-8编码
git config i18n.commit.encoding utf-8
# 设置输出 log utf-8 编码
git config i18n.logoutputencoding utf-8
# 设环境变量LESSCHARSET为utf-8
# export LESSCHARSET=utf-8

# 去除SECURITY WARNING警告
git config http.sslVerify true
# 设置提交缓存大小为500M
git config http.postBuffer 524288000
# 设置提交缓存大小为1G
#git config http.postBuffer 1048576000
# 设置提交缓存大小为1.5G
#git config http.postBuffer 1610612736


git commit -m ":cn: 🖋 :memo: 🥇 $(git config user.name) auto save at `date +%Y-%m-%d\ %H:%M:%S`"
git pull origin master
git push -u origin master