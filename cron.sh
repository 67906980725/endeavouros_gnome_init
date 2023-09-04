#!/usr/bin/env bash

source ./cp_conf.sh
source ./default_path.sh


cp_conf_home ".local/bin/cron"
sh ./app.sh desk "$BIN_PATH/cron" icron
mv -f "$HOME/.local/share/applications/icron.desktop" "$HOME/.config/autostart/"


cp_conf_home ".local/bin/sunset_sunrise" # 需要到.local/bin/sunset_sunrise中改地区
$HOME/.local/bin/sunset_sunrise init
cp_conf_home ".local/bin/crons/sunset_sunrise"
