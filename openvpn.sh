#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install openvpn

cp_conf_home ".local/bin/vpn"