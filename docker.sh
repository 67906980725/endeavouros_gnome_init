#!/usr/bin/env bash

source ./install.sh


install docker docker-compose
sudo systemctl enable --now docker
# sudo groupadd docker # 新建一个 docker 组
sudo usermod -aG docker ${USER} # 当前用户加入 docker 组
newgrp ${USER} # 刷新组缓存, 即时生效
newgrp docker # 更新 docker 组
# 如果登录或操作镜像时还是提示权限问题, 重启一下
#  加速
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
sudo systemctl restart docker # 要正常拉取镜像需要重启