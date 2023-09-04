#!/usr/bin/env bash

source ./default_path.sh

fname="DataGrip-2020.1.3"

dpath="$DOWN_PATH/${fname}.tar.gz"
curl -o "$dpath" -L "https://download.jetbrains.com.cn/datagrip/datagrip-2020.1.3.tar.gz"
mkdir -p "$HOME/.local/app"
tar -zxvf "$dpath" -C "$APP_PATH/"

ipath="$APP_PATH/${fname}"
sh ./app.sh desk "$ipath/bin/datagrip.sh" datagrip "$ipath/bin/datagrip.png"

act_path="$ipath/act"
mkdir -p "$act_path"
cp ./conf/home/Downloads/jetbrains-2020.1.3-agent.jar "$act_path/"
nemo "$act_path"
echo "打开datagrip后试用, 然后把jetbrains-2020.1.3-agent.jar拖到软件界面中就可以激活了"
# 装个 Auto Dark Mode 插件就可以跟随系统深色模式了
