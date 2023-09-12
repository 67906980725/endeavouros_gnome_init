#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

gnome() {
    # 安装 gnome 并开启服务
    install gnome gdm
    #install gnome-extra 
    # 排除 gnome-weather gnome-maps gnome-recipes polari
    # gnome-games libgnome-games-support
    # gnome-2048 gnome-mahjongg gnome-chess gnome-klotski gnome-mines gnome-nibbles gnome-taquin gnome-sudoku gnome-tetravex quadrapassel lightsoff iagno gnome-robots five-or-more four-in-a-row tali
    
    sudo systemctl disable lightdm
    sudo systemctl enable --now gdm
}

nemo() {
    // 第三方文件管理器
    install nemo nemo-fileroller nemo-preview nemo-seahorse
    #install_ur nemo-compare
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search # 默认管理器
    gsettings set org.nemo.desktop show-desktop-icons true                         # 显示 desktop 文件图标
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kgx      # 默认终端
}

# 扩展
plugin() {
    # 托盘 重启/注销后在"扩展"中启用
    #xdg-open https://extensions.gnome.org/extension/615/appindicator-support/
    install gnome-shell-extension-appindicator

    # 浏览器管理扩展
    #  chrome
    install chrome-gnome-shell
    #  firefox
    install_ur firefox-extension-gnome-shell-integration
    firefox https://addons.mozilla.org/zh-CN/firefox/addon/gnome-shell-integration/

    # 允许状态栏主题
    xdg-open https://extensions.gnome.org/extension/19/user-themes

    # 删除“窗口已就绪”通知，改为使窗口成为焦点
    xdg-open https://extensions.gnome.org/extension/5410/grand-theft-focus/

    # 剪切板
    #xdg-open https://extensions.gnome.org/extension/779/clipboard-indicator/
    xdg-open https://extensions.gnome.org/extension/5721/clipboard-indicator/

    # 网速
    xdg-open https://extensions.gnome.org/extension/1085/simple-net-speed/
    # 保持在托盘区最左侧显示 登录后重新加载以实现网速插件最后加载的效果
    cp_conf_home ".config/autostart/reload_net_speed_monitor.desktop"
    # 修改默认模式为第 4 个并禁用点击轮换
    # sed -i '6 s@0@3@' "$HOME/.local/share/gnome-shell/extensions/simplenetspeed@biji.extension/schemas/org.gnome.shell.extensions.simplenetspeed.gschema.xml"
    # sed -i 's/ button\.connect/ \/\/button\.connect/' "$HOME/.local/share/gnome-shell/extensions/simplenetspeed@biji.extension/extension.js"

    # 使用 Ctrl+Super+Up/Down 对工作区重新排序
    xdg-open https://extensions.gnome.org/extension/3685/reorder-workspaces/

    # 屏幕圆角
    xdg-open https://extensions.gnome.org/extension/1514/rounded-corners/

    # 自动最大化新窗口，在其周围留下“无用的间隙”
    xdg-open https://extensions.gnome.org/extension/5696/one-window-wonderland/

    # 窗口最大化时无标题栏
    xdg-open https://extensions.gnome.org/extension/4630/no-titlebar-when-maximized/

    # 在 GNOME 的应用程序菜单中隐藏应用程序
    xdg-open https://extensions.gnome.org/extension/5895/app-hider/

    # 工作区切换环绕
    xdg-open https://extensions.gnome.org/extension/1116/workspace-switch-wraparound/

    # 自定义主题色
    xdg-open https://extensions.gnome.org/extension/5547/custom-accent-colors/

    # 透明状态栏
    xdg-open https://extensions.gnome.org/extension/1765/transparent-topbar/

    # 天气
    xdg-open https://extensions.gnome.org/extension/750/openweather/

    # 为你的无线网络生成分享二维码
    xdg-open https://extensions.gnome.org/extension/5416/wifi-qrcode/

    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 user-theme)"
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 appindicatorsupport)"
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 netspeed)"

    # gsettings set org.gnome.shell enabled-extensions "['clipboard-indicator@tudmotu.com', 'netspeed@alynx.one', 'appindicatorsupport@rgcjonas.gmail.com']"
}

# 主题
theme() {
    install vimix-cursors tela-circle-icon-theme-git qogir-icon-theme-git gnome-themes-extra
    # 设置图标主题
    gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle'
    # 设置光标主题
    gsettings set org.gnome.desktop.interface cursor-theme 'Vimix-cursors'
    # 设置光标大小
    gsettings set org.gnome.desktop.interface cursor-size 32

    # 全局深色模式切换脚本 
    # eg: toggelt_dark_mode light / toggelt_dark_mode dark
    cp_conf_home ".local/bin/toggelt_dark_mode"

    # 安装 orchis 主题并设置
    # 选不带 git 的, 默认 github 拉不动, 需要手动执行后去加速站下包
    install_ur orchis-theme
    gsettings set org.gnome.shell.extensions.user-theme name 'Orchis-Light-Compact'

    # 安装 qt 主题并配置, adwaita 是 gtk/qt 共有的, 可以用 qgnomeplatform 来同步切换深色模式
    install adwaita-qt5 adwaita-qt6 qgnomeplatform-qt5 qgnomeplatform-qt6
    # QT_QPA_PLATFORMTHEME=qgnomeplatform
    cp_conf_home ".config/environment.d/gnome.conf"
}

# 触摸板
touchpad() {
    gsettings set org.gnome.desktop.peripherals.touchpad speed "0.66972477064220182" # 速度
    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true           # 轻触以点击
}

# 护眼
eye() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true             # 开启护
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3500         # 色温
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false # 关闭定时开关
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20.0       # 永不关闭
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 20.0
}

# 快捷键 重启后生效
keybind() {
    # 修改切换窗口为 alt+tab
    gsettings set org.gnome.desktop.wm.keybindings switch-windows '["<Alt>Tab"]'
    # 修改切换窗口/应用不跨工作区 (win+滚轮可以切换工作区)
    gsettings set org.gnome.shell.app-switcher current-workspace-only true

    ## 自定义快捷键
    # 快捷键注册表 注册下边定义的快捷键id
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
        "[ \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/' \
    ]"

    # win+c 计算器
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Super>c"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-calculator"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Calculator"

    # win+e 文件管理
    #local file_manager="nemo"
    local file_manager="nautilus -w"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "$file_manager"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "file-manager"
    
    # ctrl+alt+t console
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Ctrl><Alt>t"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "kgx"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "console"
    
    # alt+shift+a 截图
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "<Shift><Alt>a"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "flameshot gui"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "flameshot"
    
    # 亮度
    install brightnessctl
    #  ctrl+alt+shift+= 亮度+
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding "<Ctrl><Alt><Shift>equal"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command "brightnessctl set 2.5%+"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name "brightness plus"
    #  ctrl+alt+shift+- 亮度-
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding "<Ctrl><Alt><Shift>minus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command "brightnessctl set 2.5%-"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name "brightness minus"
    
    # ctrl+alt+shift+m 禁用/启用 麦克风
    cp_conf_home ".local/bin/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding "<Ctrl><Alt><Shift>m"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command "$BIN_PATH/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name "microphon mute toggelt"
    
    # 音量
    # ctrl+alt+shift+0 音量+
    cp_conf_home ".local/bin/volume_change"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding "<Ctrl><Alt><Shift>0"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command "$BIN_PATH/volume_change plus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name "volume plus"
    # ctrl+alt+shift+9 音量-
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding "<Ctrl><Alt><Shift>9"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command "$BIN_PATH/volume_change substract"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name "volume substract"
    
    # ctrl+alt+shift+d dark/light 深色模式切换
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding "<Ctrl><Alt><Shift>d"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command "$BIN_PATH/toggelt_dark_mode"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name "toggelt dark mode"
    
    # ctrl+shift+esc monitor (任务管理器)
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ binding "<Ctrl><Shift>Escape"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ command "gnome-system-monitor"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ name "monitor"
}

all() {
    nemo
    plugin
    theme
    touchpad
    eye
    keybind
}

case $1 in
nemo) nemo ;;
plugin) plugin ;;
theme) theme ;;
touchpad) touchpad ;;
eye) eye ;;
keybind) keybind ;;
*) all ;;
esac
