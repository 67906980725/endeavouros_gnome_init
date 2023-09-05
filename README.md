# endeavouros gnome 国内初始化脚本

适用于 `endeavouros gnome` 桌面环境新装后的简单配置

## 安装

``` shell
# 重新注册 ssh 私钥 (如果有的话
chmod 700 ~/.ssh
chmod 644  ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

git clone https://github.com/67906980725/endeavouros_gnome_init.git
sh ./endeavouros_gnome_init/init.sh
```

也可以根据需要单独运行 `init.sh` 中包含的脚本

## 提示

***在线**安装 `endeavouros` 前最好在 `welcome` 中挨个儿更新下源, 防止安装时间过长

*`linux` 装软件时如果有奇怪的报错找不到问题可以更新一下再试

*`arch` 装软件后如果有奇怪的问题可以更新一下然后重启再看

*`arch` 日常更新后如果有奇怪的问题多半重启一下就好了
