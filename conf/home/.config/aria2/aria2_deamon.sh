#!/usr/bin/env bash

# 切换工作目录到当前脚本目录
#aria2_conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}/aria2"
#cd "$aria2_conf_dir"
aria2_conf_dir="$(dirname "$0")"

run_aria2c_daemon() {
  echo "后台启动 aria2"

  /usr/bin/aria2c \
  --continue \
  --daemon=true \
  --conf-path=$aria2_conf_dir/aria2.conf \
  --dir=$HOME/Downloads \
  --input-file=$aria2_conf_dir/aria2.session \
  --save-session=$aria2_conf_dir/aria2.session \
  --log=$aria2_conf_dir/aria2.log
}

# 更新 trackers
update_bt_trackers() {
  echo "执行 update_bt_trackers 开始"

  # github代理, 如果环境变量有就用环境变量值
  GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"

  # 下载 trackers 解压后删除
  wget "${GITHUB_PROXY}https://github.com/ngosang/trackerslist/archive/refs/heads/master.zip"
  unzip master.zip
  rm -f master.zip

  # 使用的 tracker 文件
  #use_file="trackers_best.txt" # 最优
  local use_file="trackers_all.txt" # 全部
  # 解压生成的目录
  local tracker_dir_name="trackerslist-master"
  # 读取文件内容
  local content=$(cat "./$tracker_dir_name/$use_file")
  # 去除空行和行首尾空白字符
  local trimmed_content=$(echo "$content" | awk '{ gsub(/^[[:space:]]+|[[:space:]]+$/, ""); if ($0 != "") print }')  
  # 将所有行拼接成一个字符串，用逗号分隔并去除结尾逗号
  local trackers=$(echo "$trimmed_content" | sed 's/$/,/g' | tr -d '\n' | sed 's/,$//') 
  # 写入配置文件
  sed -i '/^bt-tracker=/c\bt-tracker='$trackers'' ./aria2.conf
  # 删除解压生成的目录
  rm -rf "$tracker_dir_name"

  echo "执行 update_bt_trackers 结束"
}

# trackers 有更新记录并未满一天时不更新, 否刚更新
try_update_bt_trackers() {
  echo "执行 try_update_bt_trackers 开始"

  # 记录上次更新时间的文件
  local time_file="update_bt_tracker_time.txt"
  local now="$(date "+%Y-%m-%d %H:%M:%S")"
  if [ -f "$time_file" ]; then
    # 提取上次更新时间转为秒数并加一天
    local update_time="$(cat $time_file)"
    local update_time_seconds=$(date -d "$update_time" "+%s")
    ((t = update_time_seconds + 86400))
    # 当前时间(秒)
    local t_n=$(date -d "$now" "+%s")
    if [ $t_n -le $t ]; then
      # 如果距上次更新不足一天就返回
      echo "距上次更新不足一天, 返回"
      echo "执行 try_update_bt_trackers 结束"
      return
    fi
  fi

  update_bt_trackers && \
  echo "$now" > "$time_file"

  echo "执行 try_update_bt_trackers 结束"
}

_daemon() {
  # 后台启动 aria2
  run_aria2c_daemon
  sleep 5
  while true; do
      # 每 30 分钟尝试更新 bt-trackers
      try_update_bt_trackers
      sleep 1800
  done
}
_daemon