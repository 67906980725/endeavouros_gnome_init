#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install_ur navicat15-premium-cs
cp_conf_home ".local/bin/renavicat"
