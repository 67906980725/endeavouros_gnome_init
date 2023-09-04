#!/usr/bin/env bash

source ./install.sh
install_ur xbydriver-appimage


# source ./default_path.sh
# source ./cp_conf.sh

# xdg-open https://github.com/odomu/aliyunpan/releases

# ver="3.10.27"
# file_name="alixby-$ver-linux-x86_64.AppImage"

# dfile="$DOWN_PATH/$file_name"
# mkdir -p $APP_PATH
# bin_file="$APP_PATH/$file_name"

# if [ ! -e "$dfile" ]; then
#     ./conf/home/.local/bin/down_github https://github.com/odomu/aliyunpan/releases/download/v$ver/$file_name 1
#     # find $HOME/Downloads/ -name "*.AppImage" | xargs chmod +x
# fi

# mv -f $dfile $bin_file

# cp_conf_home ".local/share/icons/other/aliyunpan.png"
# sh ./app.sh desk "$bin_file" aliyunpan "$HOME/.local/share/icons/other/aliyunpan.png"
