#!/usr/bin/env bash

cd $(dirname "$0")

open_gnome_proxy() {
  echo "fastgithub open_gnome_proxy 开启系统代理"

  gsettings set org.gnome.system.proxy mode 'manual'
  gsettings set org.gnome.system.proxy.http host '127.0.0.1' 
  gsettings set org.gnome.system.proxy.http port 38457
  gsettings set org.gnome.system.proxy.https host '127.0.0.1' 
  gsettings set org.gnome.system.proxy.https port 38457
  # gsettings set org.gnome.system.proxy.socks host '127.0.0.1' 
  # gsettings set org.gnome.system.proxy.socks port 38457

  # 或自动
  # https://blog.csdn.net/weixin_33924220/article/details/91796879
  # gsettings set org.gnome.system.proxy mode 'auto'
  # gsettings set org.gnome.system.proxy autoconfig-url 'http://127.0.0.1:38457'

  ignore_hosts=$(gsettings get org.gnome.system.proxy ignore-hosts)
  if [ "$ignore_hosts" = "" ] || [ "$ignore_hosts" = "@as []" ]; then
    gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '127.0.0.0/8', '::1']"
  fi
}

close_gnome_proxy() {
  echo "fastgithub close_gnome_proxy 关闭系统代理"
  
  gsettings set org.gnome.system.proxy mode 'none' 
}

on_destory() {
  echo "fastgithub on_destory close_gnome_proxy 关闭系统代理"
  close_gnome_proxy
}


if [ ! -e "cacert" ]; then
  # 没有 cacert 目录说明是第一次启动, 打开当前目录方便安装证书
  xdg-open "./"
fi

# 开启系统代理
open_gnome_proxy
# 捕获中断信号后清除系统代理
trap on_destory INT
# fastgithub 启动
sudo ./fastgithub

echo "after close_gnome_proxy 关闭系统代理"
close_gnome_proxy
