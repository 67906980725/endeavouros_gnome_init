#!/usr/bin/env bash

source ./default_path.sh

## 把可执行文件软链接到~/.local/bin
cmd()
{
    if [ "$1" != "" ] && [ -x "$1" ]; then
        r_path=$(realpath "$1")
        chmod +x "$r_path"
        ln -s "$r_path" "$BIN_PATH/$2"
    fi
}

## 为绿色软件创建启动图标
desk()
{
  # $1: bin_name $2:app_name $3: icon_name $4: param
  if [ "$1" != "" ] || [ "$4" != "" ] ; then
    echo "创建启动图标:${2}, 如有报错 [Operation not permitted] 可以忽略"
    r_path=""
    if [ "$1" != "" ]; then
      r_path=$(realpath "$1")
      chmod +x "$r_path"
    fi

# Exec=sh -c \"exec ${r_path} $4\"

        echo "
[Desktop Entry]
Encoding=UTF-8
Type=Application
Terminal=false
Icon=$3
Exec=sh -c \"${r_path} $4\"
Name=$2
Name[zh_CN]=$2
Comment=$2
Comment[zh_CN]=$2
Categories=Tool
" > ~/.local/share/applications/${2}.desktop
  fi
}


case $1 in
    desk) desk "$2" "$3" "$4" "$5";;
    *) cmd "$1" "$2";;
esac
