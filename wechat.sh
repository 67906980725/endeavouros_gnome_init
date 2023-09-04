#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 中文口口或不显示问题
# 自己找 msyhl.ttc msyhbd.ttc msyh.ttc 复制到 ~/.local/share/fonts 下
# wine 设置中 显示-屏幕分辨率 下描述文字口口口问题
# 自己找 simsun.ttc simsunb.ttc 复制到 ~/.local/share/fonts 下

# deepin-wine-wechat依赖Multilib仓库中的一些 32 位库，
# Archlinux 默认没有开启Multilib仓库, 
# 如果是用archinstall安装的系统应该提前选好Optional repositories: ['multilib']
# 如果没有提前选择也不要紧，前边的mirror脚本覆盖的/etc/pacman.conf里也是开启了的
install base-devel

cp_conf_home ".cache/winetricks/msls31"
# 如果是用 wine-for-wechat 的话不要用包管理器安装 wine-mono wine-gecko, 不然微信安装程序会变透明
install wine wine-mono wine-gecko wine-wechat-setup lib32-v4l-utils
# install lib32-nvidia-utils

## could not open working directory clean up... starting in the Windows directory 时: rm $HOME/.local/lib/wine-wechat/default/drive_c/WeChatSetup.exe



# bak
#install_ur deepin-wine-wechat
# 提示从git下载文件失败不要怕， 找个github文件加速站
# 如： https://tool.mintimate.cn/gh/
# 手动下载放进~/.cache/paru/clone/deepin-wine-wechat/
# 或目录下PKGBUILD文件中对应下载位置
# 后再试
# 如果加速站也提示没文件就是文件url错了， 到github
# https://github.com/vufa/deepin-wine-wechat-arch
# 找正确文件url下载
#/opt/apps/com.qq.weixin.deepin/files/run.sh winecfg
# 快捷打开winecfg或其他fix功能
#cp_conf_home ".local/bin/rewechat"