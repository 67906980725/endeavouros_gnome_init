#!/usr/bin/env bash

# sudo 尝试失败次数太多会始终密码错误, 重启就好了

source ./install.sh
source ./cp_conf.sh


# cp_conf_root "/etc/xdg/reflector/reflector.conf" 
# sudo reflector -c China --sort rate --threads 16 --save /etc/pacman.d/mirrorlist 
# sudo systemctl enable --now reflector

# archlinuxcn
cp_conf_root "/etc/pacman.conf"
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring 

# 没有中文字体的话先安装下, 建议直接选择中文安装系统
# install wqy-microhei


fix_keyring() {
    # 如果装完archlinuxcn-keyring很多类似下边的错
    # ERROR: 4B1DE545A801D4549BFD3FEF90CB3D62C13D4796 could not be locally signed
    # 先检查时钟是否正确
    timedatectl status
    # 然后
    sudo rm -rf /etc/pacman.d/gnupg
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman-key --populate archlinuxcn
}