#!/usr/bin/env bash

source ./install.sh

#install optimus-manager # 目前不支持 wayland: 2023-05-07 11:00:52

# 开源 amd gpu 驱动. 参考 https://arch.icekylin.online/rookie/graphic-driver.html
install mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon lib32-vulkan-mesa-layers


