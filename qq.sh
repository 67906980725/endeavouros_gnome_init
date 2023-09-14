#!/usr/bin/env bash

source ./install.sh

install_ur linuxqq

# 适用小新 pro 13 的缩放 
# sudo sed -i '/^Exec=/s/$/\ --force-device-scale-factor=2.5/' /usr/share/applications/qq.desktop
# 也可以用 ctrl+= 来放大, ctrl+- 来缩小 (一些其它的软件可以用 ctrl+shift+= 放大)

# 修复闪退
# rm -r "$HOME/.config/QQ/crash_files"
# rm -r "$HOME/.config/QQ"
# reboot
