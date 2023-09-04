#!/usr/bin/env bash

# 解决重装系统后恢复的密钥不可用问题

if [ -e "$HOME/.ssh/id_rsa" ]; then
    chmod 700 ~/.ssh  #(drwx------)
    chmod 644  ~/.ssh/id_rsa.pub  #(-rw-r--r--)
    chmod 600 ~/.ssh/id_rsa   #(-rw-------)

    ssh-add ~/.ssh/id_rsa
fi
