#!/usr/bin/env bash

# 引入工具方法
source ./install.sh
source ./cp_conf.sh

# 从 github clone 插件
# GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"
# git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
# git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone --depth=1 ${GITHUB_PROXY}https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# git clone --depth=1 ${GITHUB_PROXY}https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 安装 zsh 及常用依赖
install exa fzf zsh oh-my-zsh-git
install zsh-autosuggestions zsh-completions zsh-syntax-highlighting fzf-tab-git zsh-lovers zsh-theme-powerlevel10k powerline-fonts awesome-terminal-fonts

# 初始化配置
# cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
cp_conf_home ".zshrc"
cp_conf_home ".p10k.zsh"

# 设为默认
#  不加上会报错 :“/usr/bin/zsh”未列在 /etc/shells 中
cp_conf_root "/etc/shells"
chsh -s "$(which zsh)"

# 一些常用命令的封装
cp_conf_home ".local/bin/now"
cp_conf_home ".local/bin/k"
cp_conf_home ".local/bin/len"
cp_conf_home ".local/bin/pkg_name"

cp_conf_home ".local/bin/down_github"
