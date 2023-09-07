#!/usr/bin/env bash

# 切换工作目录到脚本目录
# D="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $(dirname "$0")

# 引入工具方法
source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

# mirror 国内镜像
sh ./mirror.sh

# hardware 硬件
# 执行后蓝牙能搜到但连不上的话重启一下试试
sh ./bluetooth.sh
# 开机如果会滴的一声, 要关闭的话需要这个
# sh ./blacklist.sh

### cmd 命令行
## cmd-base 必备
install base-devel bat fd exa neovim python-pynvim paru asp
## 命令行常用默认配置
sh ./cmd_base_config.sh
sh ./zsh.sh
## cmd-net
#cp_conf_root "/etc/hosts"
#sh ./ssh.sh
#sh ./vnstat.sh
#sh ./openvpn.sh
## cmd-sys 系统配置
# 碰到 sudo 密码错误时
#sudo sed -i "/root ALL/a $USER\ ALL=(ALL:ALL)\ ALL" /etc/sudoers
# btrfs 开启 swap 到文件
#sh ./swap.sh

### gui 图形界面
## gui-xorg
# 剪切板
install xclip

## gui-wayland
sh ./wayland.sh

## gui-base
# gnome 桌面配置
sh ./gnome.sh
# 输入法
sh ./fcitx5.sh
# 浏览器
sh ./firefox.sh
# edge
install_ur microsoft-edge-stable-bin
# code
sh ./vscode.sh
# 视频播放器
sh ./mpv.sh
# 截屏录屏
sh ./recorder.sh
# 下崽器
sh ./aria2.sh
# 自定义脚本使用系统通知
# sh ./notify.sh
# 定时任务
# sh ./cron.sh
install dmidecode # 可以 dmidecode 获取硬件信息
# ntfs 支持
#install ntfs-3g

## gui-normal
sh ./qq.sh
sh ./wechat.sh
# 阿里云盘
sh ./aliyunpan.sh
# 魔法
sh ./clash-verge.sh
# fastgithub (firefox 记得安装证书
sh ./fastgithub.sh
# 一些自定义快捷启动图标, 根据需要制定
# sh ./desktop_file.sh

## gui-office
# wps-office
sh ./wps.sh
# 向日葵
# sh ./sunlogin.sh
# 腾讯会议
#install_ur com.qq.weixin.work.deepin-x11
install_ur wemeet-bin

## gui-develop-java
# install intellij-idea-community-edition jdk8-openjdk 
# sh ./datagrip.sh
# sh ./navicat.sh

## gui-develop-rust
# sh ./rust.sh

## gui-runtime 虚拟机/容器
# 从 appimage 包安装应用
#install_ur appimagelauncher
sh ./docker.sh
sh ./virtual_box.sh

## gui-game
# switch
# sh ./yuzu.sh

# font 字体
sh ./font.sh

reboot