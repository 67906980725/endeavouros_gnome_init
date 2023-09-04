#!/usr/bin/env bash

# 关闭蜂鸣

source ./cp_conf.sh

cp_conf_root "/etc/modprobe.d/blacklist.conf"

sudo rmmod pcspkr
cp_conf_root "/etc/modprobe.d/nobeep.conf"