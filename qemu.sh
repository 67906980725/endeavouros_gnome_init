#!/usr/bin/env bash

source ./install.sh

# qemu
install qemu-desktop qemu-user-static virt-manager ebtables dnsmasq samba
sudo sudo systemctl enable libvirtd --now

# 打开virt-manager, 新建连接, Hypervisor 选 QEMU-KVM,(不能是user-session那个, 还不支持virtiofs)

# 网络 
# 虚拟机硬件信息里add harware - network - *****NAT   (下次启动报错network 'default' not active 删掉重加一个)

# 共享文件夹和剪切板
# 虚拟机硬件信息(感叹号图标) memory 里勾上 enable shared memory, 
# 点击下方 add hardware - filesystem - driver:virtiofs, source path:主机上要共享的文件夹, target path:windows下就是磁盘名
# 在虚拟机里下载 winfsp 安装
# 在虚拟机里下载 virtio-win.iso 或 virtio-win-guest-tools.exe 安装, 在服务中打开virtio手动开启服务并设为自启
# *virtio-win.iso 也可以先在主机下载好在虚拟机硬件信息里把 cdrom 挂载镜像换成 virtio-win.iso
# virtio-win 下载页: https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md
