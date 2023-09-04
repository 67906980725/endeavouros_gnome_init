#!/usr/bin/env bash

source ./install.sh

install yadm

# 确保ssh密钥已存在并可用
repo="git@gitee.com:g8307640632/dotfiles_arch.git"
yadm clone "$repo" ~
