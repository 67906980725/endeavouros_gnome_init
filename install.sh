#!/usr/bin/env bash

install()
{
    sudo pacman -S --noconfirm --needed --noscriptlet "$@"
}

install_ur()
{
    paru -S --skipreview --nouseask --nocheck --noconfirm --needed --noscriptlet "$@"
}