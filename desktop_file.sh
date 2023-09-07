#!/usr/bin/env bash
# 创建常用启动图标

source ./default_path.sh
source ./app.sh

## vscode 常用项目
# vscode 路径
vscode_path="$(which code)"
# 笔记
sh ./app.sh desk "$vscode_path" note vscode "$HOME/asset/note"
# 配置项目
sh ./app.sh desk "$vscode_path" sys_config_proj archlinux "$(pwd)"
# 工作笔记
sh ./app.sh desk "$vscode_path" work_note vscode "$HOME/asset/note/office"

## 多程序启动
# 日常软件
group_normal() {
    note_cmd="gtk-launch note"
    sys_config_proj_cmd="gtk-launch sys_config_proj"
    firefox_cmd="gtk-launch firefox"
    qq_cmd="gtk-launch qq "
    wechat_cmd="/opt/apps/com.qq.weixin.deepin/files/run.sh"
    all_cmd="${note_cmd} & ${sys_config_proj_cmd} & ${firefox_cmd} & ${qq_cmd} & ${wechat_cmd} & "
    sh ./app.sh desk "" group_normal ankama-launcher "$all_cmd" 
}
group_normal

# 工作软件
group_work() {
    note_cmd="gtk-launch work_note"
    work_dir_cmd="gtk-launch nemo $HOME/asset/office_java "
    terminal_cmd="kgx "
    idea_cmd="gtk-launch idea "
    datagrip_cmd="gtk-launch datagrip"
    all_cmd="${note_cmd} & ${work_dir_cmd} & ${terminal_cmd} & ${idea_cmd} & ${datagrip_cmd}"
    sh ./app.sh desk "" group_work ankama-launcher "$all_cmd" 
}
# group_work
