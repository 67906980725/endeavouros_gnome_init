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

#reboot

# win10 镜像
# https://next.itellyou.cn/Original/#cbp=Product?ID=f905b2d9-11e7-4ee3-8b52-407a8befe8d1

# 增强功能
# 安装完启动系统后点击 工具栏-设备-安装增强功能
# (windows)打开资源管理器-此电脑-cd驱动器(D:)virtualbox-guest-
# 程序一般不会直接在前台弹出窗口(windows10), 在任务栏点击应用图标唤起前台完成安装
# 重启之后就可以自动调整显示大小,开启共享文件夹/共享剪切板和鼠标拖放(状态栏-设备)了