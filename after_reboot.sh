#!/usr/bin/env bash

source ./install.sh

# 登录 docker
# docker login
# aria2 pro
# sh ./aria2_pro.sh

## end
if [ -e "../conf_bak" ]; then
    rm -r ./conf_bak
else
    mv ./conf_bak ../
fi
