#!/usr/bin/env bash

source ./install.sh

# flameshot 截图命令： flameshot gui
#  参考 https://wiki.archlinux.org/title/PipeWire#WebRTC_screen_sharing https://wiki.archlinux.org/title/XDG_Desktop_Portal
install flameshot xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-wlr xdg-desktop-portal-gtk grim wlroots wf-recorder v4l2loopback-dkms slurp

# obs必要设置: 
#    `来源或预览上右击`-`变换`-`拉伸到全屏`; 
#    `文件-设置-输出-输出模式-高级`; 
#    `输出-录像-格式` 设为 `mp4` (便于分享时在线预览)
install obs-studio
#  设置中文不口口口
install adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-han-mono-cn-fonts
