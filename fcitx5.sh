#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

install fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-chinese-addons fcitx5-rime 
cp -frp ./conf/home/.config/fcitx5 $HOME/.config/
cp -frp ./conf/home/.local/share/fcitx5/themes $HOME/.local/share/fcitx5/

# env
# export LANG="zh-CN.UTF-8" 
# export LC_ALL="en_US.UTF-8"
# export GTK_IM_MODULE="fcitx"
# export QT_IM_MODULE"="fcitx"
# export XMODIFIERS"="@im=fcitx"
# export INPUT_METHOD"="fcitx"
# export XIM="fcitx"
# export XIM_PROGRAM="fcitx"
# export GLFW_IM_MODULE="ibus"
cp_conf_home ".config/environment.d/ime.conf"

# cp_conf_root "/etc/locale.gen"
# sudo locale-gen

# localectl set-locale LANG=zh_CN.UTF-8
# cp_conf_home ".config/locale.conf"

