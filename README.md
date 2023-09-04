# endeavouros gnome 国内初始化脚本

适用于 `endeavouros gnome` 桌面环境新装后的简单配置

*需要当前用户是常用用户而非 `root`, 并且有 `root` 权限

*记得提前恢复 `.ssh` 目录

``` shell
chmod 700 ~/.ssh
chmod 644  ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

mkdir -p $HOME/.local/project/sys
cd $HOME/.local/project/sys
git clone git@github.com:g8307640632/endeavouros_gnome_init.git
sh ./endeavouros_gnome_init/init.sh
```

重启后

``` shell
sh $HOME/.local/project/sys/endeavouros_gnome_init/after_reboot.sh
 
```

*`linux` 装软件时如果有奇怪的报错找不到问题可以更新一下再试

*`arch` 装软件后如果有奇怪的问题可以更新一下然后重启再看

*`arch` 正常更新后如果有奇怪的问题多半重启一下就可以
