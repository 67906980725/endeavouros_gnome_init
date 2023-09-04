#!/usr/bin/env bash

source ./install.sh

install_ur sunlogin
# 要想启动 sunlogin 需要提前开启服务
sudo systemctl enable --now runsunloginclient.service