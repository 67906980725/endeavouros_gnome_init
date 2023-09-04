#!/usr/bin/env bash

# https://wiki.archlinuxcn.org/wiki/Aria2

# 引入工具方法
source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

# 安装 aria2c 和 ariang
#install aria2-fast
install aria2 ariang-allinone

# 默认配置 https://zhuanlan.zhihu.com/p/418276041
cp_conf_home ".config/aria2"

# 添加服务并启动 https://man.archlinux.org/man/systemd.unit.5
# https://wiki.archlinuxcn.org/wiki/Systemd
#cp_conf_home ".config/systemd/user/aria2cd.service"
# /usr/bin/sh -c ${XDG_CONFIG_HOME:-$HOME/.config}/aria2/aria2_deamon.sh
cp_conf_home ".config/systemd/user/aria2.service"
systemctl enable --now --user aria2.service
#systemctl disable --now --user aria2.service 
