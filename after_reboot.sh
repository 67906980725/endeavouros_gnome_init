#!/usr/bin/env bash

source ./install.sh

# docker
docker login # 登录
sh ./aria2_pro.sh


# end
if [ -e "../conf_bak" ]; then
    rm -r ./conf_bak
else
    mv ./conf_bak ../
fi