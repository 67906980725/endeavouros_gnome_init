# if [ -e .bashrc ]; then 
#   source .bashrc
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( z git zsh-autosuggestions zsh-completions zsh-syntax-highlighting fzf-tab )


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ---------- 自定义 ----------

# 自定义环境变量
export BIN_PATH=${HOME}/.local/bin
export APP_IMAGE_PATH=${HOME}/.local/appimage
export _LD_LIBRARY_PATH=${HOME}/.local/lib

# 默认环境变量
export PATH=$SCRIPT_PATH:$BIN_PATH:$APP_IMAGE_PATH:$_LD_LIBRARY_PATH:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=${_LD_LIBRARY_PATH}:$LD_LIBRARY_PATH

# 包管理器别名
alias sync="sudo pacman -Syyy"
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
# alias update="paru"
alias search="sudo pacman -Ss"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias clr-cache="sudo pacman -Scc"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -Rns"

# 常用命令别名
alias ls="exa --color=auto --icons";
alias la="ls -a";
alias l="ls -l";
alias lla="ls -al";
alias lt="ls --tree";
alias h="cd ~";
alias c="clear";
alias b="cd ../";
alias bb="cd ../../";
alias bbb="cd ../../../";
alias bbbb="cd ../../../../";
alias bbbbb="cd ../../../../../";
alias bbbbbb="cd ../../../../../../";
alias bbbbbbb="cd ../../../../../../../";
alias bbbbbbbb="cd ../../../../../../../../";
alias bbbbbbbbb="cd ../../../../../../../../../";
alias bbbbbbbbbb="cd ../../../../../../../../../../";
#alias cat="bat --color always --plain"; # gnome 终端白色背景时看不到字
alias grep="grep --color=auto";
alias v="nvim";

# cdls() { cd "$1" && echo $(pwd) && exa --color=auto --icons -a }
# alias cd="cdls";
# zls() { z "$1"; cdls }
# alias z="zls";

# git 别名
#  加个 flag, 不重复执行
aliased_git=0
alias_git() {
	# 长别名
	alias clone="git clone"
	alias remote="git remote"
	alias checkout="git checkout"
	alias status="git status"
	alias pull="git pull"
	alias diff="git diff"
	alias add="git add"
	alias commit="git commit"
	alias branch="git branch"
	alias push="git push"
	alias merge="git merge"
	alias rebase="git rebase"
	alias stash="git stash"
	alias reset="git reset"

	# 短别名
	alias ce="git clone"
	alias ct="git checkout"
	alias s="git status"
	alias p="git push"
	alias l="git pull"
	alias d="git diff"
	alias a="git add"
	alias c="git commit"
	alias b="git branch"
	alias m="git merge"
	alias r="git reset"

	aliased_git=1
}
unalias_git() {
	# 移除长别名
	unalias clone
	unalias remote
	unalias checkout
	unalias status
	unalias pull
	unalias diff
	unalias add
	unalias commit
	unalias branch
	unalias push
	unalias merge
	unalias rebase
	unalias stash
	unalias reset

	# 移除短别名
	unalias ce
	unalias ct
	unalias s
	unalias p
	unalias l
	unalias d
	unalias a
	unalias c
	unalias b
	unalias m
	unalias r

	aliased_git=0
}
# 路径 hook, 变更目录后如果是 git 目录, 定义别名, 否则移除别名
hook_chpwd() {
	if [ $aliased_git -eq 0 ] && git rev-parse --is-inside-work-tree >/dev/null 2>&1 ; then
		alias_git
	elif [ $aliased_git -eq 1 ]; then
		unalias_git
	fi
}
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd() { hook_chpwd }
hook_chpwd

# 检测系统代理, 有代理则启用命令行代理
# 系统代理状态变更后想在当前会话同步代理状态的话可以 uproxy 一下
uproxy() {
  local proxy_mode=$(gsettings get org.gnome.system.proxy mode)
	if [ "$proxy_mode" = "'manual'" ]; then
		echo "using proxy 代理已启用"
  	local http_proxy_port=$(gsettings get org.gnome.system.proxy.http port)
		if [ $http_proxy_port -gt 0 ]; then
  		local http_proxy_host=$(gsettings get org.gnome.system.proxy.http host | sed "s/'//g")
			export http_proxy="$http_proxy_host:$http_proxy_port"
		fi

  	local https_proxy_port=$(gsettings get org.gnome.system.proxy.https port)
		if [ $https_proxy_port -gt 0 ]; then
			local https_proxy_host=$(gsettings get org.gnome.system.proxy.https host | sed "s/'//g")
			export https_proxy="$https_proxy_host:$https_proxy_port"
		fi

		local socks_proxy_host=$(gsettings get org.gnome.system.proxy.socks host | sed "s/'//g")
  	local socks_proxy_port=$(gsettings get org.gnome.system.proxy.socks port)
		if [ $socks_proxy_port -gt 0 ]; then
			export socks_proxy="$socks_proxy_host:$socks_proxy_port"
		fi

  	local ftp_proxy_port=$(gsettings get org.gnome.system.proxy.ftp port)
		if [ $ftp_proxy_port -gt 0 ]; then
			local ftp_proxy_host=$(gsettings get org.gnome.system.proxy.ftp host | sed "s/'//g")
			export ftp_proxy="$ftp_proxy_host:$ftp_proxy_port"
		fi
	elif [ "$proxy_mode" = "'auto'" ]; then
		echo "using proxy 代理已启用"

		# https://zhuanlan.zhihu.com/p/46973701
		local auto_proxy_url=$(gsettings get org.gnome.system.proxy autoconfig-url)
		export ALL_PROXY="$auto_proxy_url"
		export all_proxy="$auto_proxy_url"
	else
		export http_proxy=""
		export https_proxy=""
		export socks_proxy=""
		export ftp_proxy=""

		export ALL_PROXY=""
		export all_proxy=""
	fi

	if [ "$proxy_mode" = "'manual'" ] || [ "$proxy_mode" = "'auto'" ]; then
		local ignore_hosts=$(gsettings get org.gnome.system.proxy ignore-hosts)
		if [ "$ignore_hosts" != "@as []" ]; then
			# echo "['localhost', '127.0.0.0/8', '::1']" | sed "s/[//g" | sed "s/]//g" | tr -d ' '	
			ignore_hosts=$(echo "$ignore_hosts" | sed "s/^\[//;s/\]$//;s/'//g" | tr -d ' ')
			# export no_proxy=localhost,127.0.0.1,localaddress,.example.com
			export no_proxy="$ignore_hosts"
		fi
	fi
}
uproxy

# 展示网络流量统计
# _LIU_LIANG=$(vnstat -d 2 | grep -v estimated | grep -v day | grep -v daily | grep -v + | sed '/^$/d' | awk -F "|" '{print $3}' | tr "\n" ' ')
# echo "昨日 / 今日: $_LIU_LIANG"
