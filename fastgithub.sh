#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"

# 版本
ver="2.1.4"
# 安装目录
install_path="$HOME/.local/app/fastgithub"
# 解压生成的文件夹
unzip_name="fastgithub_linux-x64"
# 压缩包名
zip_name="${unzip_name}.zip"

# # 下载解压移动到安装目录后删除压缩包
wget "${GITHUB_PROXY}https://github.com/dotnetcore/FastGithub/releases/download/$ver/$zip_name"
unzip "$zip_name"
rm -f "$zip_name"
if [ -e "$install_path" ]; then
  rm -rf "$install_path"
fi
mv -f "$unzip_name" "$install_path"

# 默认配置
cp_conf_home ".local/app/fastgithub/fastgithub_deamon.sh"
cp_conf_home ".local/share/applications/fastgithub.desktop"
ln -sf "$HOME/.local/share/applications/fastgithub.desktop" "$HOME/.config/autostart/"

# firefox 需要安装证书, 请查看安装目录下 README.html
# 设置->隐私与安全->证书->查看证书->证书颁发机构，导入cacert/fastgithub.cer，勾选“信任由此证书颁发机构来标识网站”
# 重新安装 fastgithub 后 firefox 报错: "对等端的证书有一个无效的签名." 时删除旧证书安装新证书就可以了