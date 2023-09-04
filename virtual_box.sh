#!/usr/bin/env bash

source ./install.sh

uname -srm # 查看内核版本

install linux-headers virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-oracle
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt
sudo usermod -a -G vboxusers $USER

#  u盘
sudo groupadd usbfs
sudo usermod -a -G usbfs $USER

#sudo reboot now #

# win10 镜像
# https://next.itellyou.cn/Original/#cbp=Product?ID=f905b2d9-11e7-4ee3-8b52-407a8befe8d1

# 在工具栏安装增强工具后就可以自动调整显示大小,共享文件夹,共享剪切板和鼠标拖放了