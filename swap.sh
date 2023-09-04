#!/usr/bin/env bash


source ./cp_conf.sh

# btrfs 开 16g swap
sudo btrfs filesystem mkswapfile --size 16g /swap

sudo swapon /swap

bak_conf_root /etc/fstab

if [ ! -e "./conf_bak/etc/fstab" ]; then
    echo "/swap                       none                swap            defaults        0   0" | sudo tee -a /etc/fstab
fi