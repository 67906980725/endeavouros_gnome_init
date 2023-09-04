#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

# if ! $(is_wayland) ; then
#     cp_conf_home ".bashrc"
#     return 0
# fi

# 必需包
install qt6-wayland wl-clipboard glfw-wayland
# 使用 xlsclients 查看 xwayland 运行中的程序
install xorg-xlsclients
# 剪切板互通
# install_ur wl-clipboard-x11

# 必需配置项
# QT_QPA_PLATFORM=wayland
# firefox
# MOZ_ENABLE_WAYLAND=1
cp_conf_home ".config/environment.d/wayland.conf"

# 从 x11 切换到 wayland
open_wayland() {
    # cp_conf_root "/etc/gdm/custom.conf" # 会被自动还原
    # 注掉原有的WaylandEnable行 在下边添加一行WaylandEnable=true
    conf_file="/etc/gdm/custom.conf"
    bak_conf_root "$conf_file"
    if [ ! -e "./conf_bak$conf_file" ]; then
        sudo sed -i '/WaylandEnable/s/^/#/' "$conf_file"
        sudo sed -i '/WaylandEnable/aWaylandEnable=true' "$conf_file"
    fi


    # 在文件 /usr/lib/udev/rules.d/61-gdm.rules 顶部添加 
    # GOTO = "gdm_prefer_wayland" # 这句一定放要在第一行
    # LABEL="gdm_prefer_wayland"
    # RUN+="/usr/lib/gdm-runtime-config set daemon PreferredDisplayServer wayland"
    # GOTO="gdm_end"
    rule_file="/usr/lib/udev/rules.d/61-gdm.rules"
    bak_conf_root "$rule_file"
    append_conf_root "$rule_file" '
    LABEL="gdm_prefer_wayland"
    RUN+="/usr/lib/gdm-runtime-config set daemon PreferredDisplayServer wayland"
    GOTO="gdm_end"
    '
    if [ ! -e "./conf_bak$rule_file" ]; then
        sudo sed -i '1i\GOTO = "gdm_prefer_wayland"' "/usr/lib/udev/rules.d/61-gdm.rules"
    fi
}
