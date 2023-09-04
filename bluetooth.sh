#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 卸载 blueman
# sudo pacman -R blueman

# 安装 bluez 套件
# install bluez bluez-utils

# 启动蓝牙服务
sudo systemctl enable --now bluetooth.service

# 开启蓝牙自启动
# cp_conf_root "/etc/bluetooth/main.conf"
