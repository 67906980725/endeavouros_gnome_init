#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 安装 vscode 回收站支持, 剩下的不知道了
install code trash-cli libappindicator-gtk3 direnv 

# 默认配置
#  ! 配置中默认了 shell 为 zsh, console 为 gnome 的 kgx, 根据实际情况修改
cp_conf_home ".config/Code - OSS/User/settings.json"
#  使用 mg 组合 z 和 code 两个命令, 方便的使用 vscode 打开常用目录
cp_conf_home ".local/bin/mg"
#  配置中使用的 jetbrains 字体
install nerd-fonts-jetbrains-mono
