#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install nodejs npm 
npm config set registry https://registry.npm.taobao.org
cp_conf_home ".config/environment.d/nodejs.conf"