#!/usr/bin/env bash

source ./default_path.sh
source ./app.sh

# 笔记
note()
{
    cmd="$(which code)"
    sh ./app.sh desk "$cmd" note vscode "$NOTE_PATH"
}
note
arch_config()
{
    cmd="$(which code)"
    sh ./app.sh desk "$cmd" arch_config archlinux "$HOME/.local/project/i/sys/arch_gnome_init"
}
arch_config
work()
{
    cmd="$(which code)"
    sh ./app.sh desk "$cmd" work vscode "$NOTE_PATH/office"
}
work

# 多程序启动
group_normal()
{
    note_cmd="gtk-launch note"
    arch_config_cmd="gtk-launch arch_config"
    firefox_cmd="gtk-launch firefox"
    terminal_cmd="kgx"
    qq_cmd="gtk-launch qq "
    wechat_cmd="/opt/apps/com.qq.weixin.deepin/files/run.sh"
    all_cmd="${note_cmd} & ${arch_config_cmd} & ${firefox_cmd} & ${terminal_cmd} & ${qq_cmd} & ${wechat_cmd} & "
    sh ./app.sh desk "" group_normal ankama-launcher "$all_cmd" 
}
group_normal
group_work()
{
    note_cmd="gtk-launch work"
    work_dir_cmd="gtk-launch nemo $HOME/asset/office_java "
    terminal_cmd="kgx "
    idea_cmd="gtk-launch idea "
    datagrip_cmd="gtk-launch datagrip"
    all_cmd="${note_cmd} & ${work_dir_cmd} & ${terminal_cmd} & ${idea_cmd} & ${datagrip_cmd}"
    sh ./app.sh desk "" group_work ankama-launcher "$all_cmd" 
}
group_work


# case $1 in
#     note) note;;
#     *) ;;
# esac

