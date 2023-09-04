#!/usr/bin/env bash

source ./install.sh

install_ur linuxqq

# 适用小新pro13的缩放 
# sudo sed -i '/^Exec=/s/$/\ --force-device-scale-factor=2.5/' /usr/share/applications/qq.desktop
# 也可以用 ctrl+shift+=来放大 ctrl+-来缩小
# 很多 electron 软件都可以这样来缩放, 一些非 eletron 软件也适用 如 terminal