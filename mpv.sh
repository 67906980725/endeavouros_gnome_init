#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install mpv

# 使用 mpv 实现简单的视频音乐随机播放 (根据实际情况修改音乐目录)
cp_conf_home ".local/bin/mp"
