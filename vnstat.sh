#!/usr/bin/env bash

source ./install.sh

install vnstat
sudo systemctl enable --now vnstat

# vnstat --add -i eth0

# 新开控制台看 昨日 今日
# _LIU_LIANG=$(vnstat -d 2 | grep -v estimated | grep -v day | grep -v daily | grep -v + | sed '/^$/d' | awk -F "|" '{print $3}' | tr "\n" ' ')
# echo "昨日 / 今日: $_LIU_LIANG"
