# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Executes commands at the start of an interactive session.


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PREZMODIR="${HOME}/.zprezto/modules"
# 延迟执行或加载zsh 命令或脚本
# git clone https://github.com/romkatv/zsh-defer.git ${PREZMODIR}/
source ${PREZMODIR}/zsh-defer/zsh-defer.plugin.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...


## --------------User configuration--------------
# You may need to manually set your language environment
export LANG=en_US.UTF-8
HIST_STAMPS="mm/dd/yyyy"


## configure pyvenv, Homebrew, PATH(GNU CLI tools), catalog ,git on MacOS {{{
if [[ $(uname -s) == "Darwin" ]]; then
    # pyenv &&pyenv-virtualenv configuration:
    # export PYENV_ROOT="/usr/local/opt/pyenv"
    # export VIRTUALENV_ROOT="/usr/local/opt/pyenv-virtualenv"
    # export PATH="${PYENV_ROOT}/bin:${VIRTUALENV_ROOT}/bin:$PATH"
    # eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"

    # HomeBrew more fast conf:
    #export HOMEBREW_GITHUB_API_TOKEN=""
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

    # GNU cmd tools PATH for Mac:
    export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/opt/python/bin/:${PATH}"
    export PATH="/usr/local/sbin:/opt/local/bin:$HOME/.yarn/bin:~/.cargo/bin/:$PATH"
    export MANPATH="/usr/local/man:/usr/local/share/man:$MANPATH"
    export MANPATH="/usr/local/opt/coreutils/share/man:/usr/local/opt/findutils/share/man:${MANPATH}"

fi
## }}}


## ssh keygen location {{{
 # if [[ -d ~/.ssh ]]; then
    export SSH_KEY_PATH="~/.ssh/id_rsa"
# else
    # mkdir ~/{.ssh,.z}
    # export SSH_KEY_PATH="~/.ssh/id_rsa"
# fi
# }}}

## ------------VIM environment path config-------------------------- {{{
    export EDITOR="$(which nvim)"
    export VIM="/usr/local/opt/neovim/share/nvim"
    export VIMFILES="${HOME}/.nvim/vimfiles"
    export VIMRUNTIME="${HOME}/.nvim/runtime"
# if [[ $(uname -s) == "Linux" ]]; then
    # export VIM="/usr/local/share/vim"
    # export VIMFILES="${VIM}/vimfiles"
    # export VIMRUNTIME="/usr/local/share/vim/vim80"
# else
    # export VIM="/usr/local/opt/vim/share/vim"
    # export VIMFILES="${VIM}/vimfiles"
    # export VIMRUNTIME="${VIM}/vim80"
    # # export VIM="/usr/local/opt/neovim/share/nvim"                 # for neovim on MacOS_Darwin
    # # export VIMRUNTIME="/usr/local/opt/neovim/share/nvim/runtime"
# fi
# }}}


# JDK/Tomcat Path {{{
    export JAVA_HOME=/usr/local/opt/java11
    # export TOMCAT_HOME=/opt/tomcat8
    # export CATALINA_HOME=$TOMCAT_HOME
    export CLASSPATH=.:${JAVA_HOME}/libexec/openjdk.jdk/Contents/Home/lib
    # export CLASSPATH=.:${JAVA_HOME}/lib:${CATALINA_HOME}/lib
    export PATH=${JAVA_HOME}/bin:$PATH
# }}}


# alias.zsh conf:
  zsh-defer source ~/.alias.zsh


# ------fzf configuration----------
  [ -f ~/.fzf.zsh ] && zsh-defer source ~/.fzf.zsh
    export FZF_DEFAULT_COMMAND="fd --type f --type l ${FD_OPTIONS}"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color= \
        always {} ||highlight -O ansi -l {} || cat {}) 2> /dev/null | head -100'"
    export FZF_DEFAULT_OPTS='--height 70% --reverse --border'

# iterm2_shell_integration configuration:
test -e "${HOME}/.iterm2_shell_integration.zsh" && zsh-defer source "${HOME}/.iterm2_shell_integration.zsh"

# nvm config:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="/usr/local/opt/nvm"
zsh-defer -c '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm
export NVM_LAZY_LOAD=true
source "${PREZMODIR}/zsh-nvm/zsh-nvm.plugin.zsh"

# zsh-z config:
# zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib
source "${PREZMODIR}/zsh-z/zsh-z.plugin.zsh"


## 关于历史纪录的配置##############################################{{{
    # 历史纪录条目数量
    export HISTSIZE=10000

    # 注销后保存的历史纪录条目数量
    export SAVEHIST=10000

    # 以附加的方式写入历史纪录
    setopt INC_APPEND_HISTORY

    # 如果连续输入的命令相同，历史纪录中只保留一个
    setopt HIST_IGNORE_DUPS

    # 为历史纪录中的命令添加时间戳
    setopt EXTENDED_HISTORY

    #启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
    setopt AUTO_PUSHD

    #相同的历史路径只保留一个
    setopt PUSHD_IGNORE_DUPS

    # 历史纪录文件
    export HISTFILE=~/.zshistory  # ensure history file visibility
## }}}

# Emacs风格 键绑定
bindkey -e
bindkey '^u' backward-kill-line

# 以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

## 开启此选项，补全时会直接选中菜单项
setopt MENU_COMPLETE

# 修正大小写
    zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# 错误校正 {{{
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*:approximate:*' max-errors 1 numeric
# }}}

## 补全类型提示分组 {{{
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
    zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
    zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
    zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
# }}}


export BAT_THEME="TwoDark"

FD_OPTIONS="--follow --exclude .git --exclude .idea --exclude node_modules --exclude venv"


# 设置使用代理
  alias setproxy="export https_proxy=http://127.0.0.1:7890; \
      export http_proxy=http://127.0.0.1:7890; \
      export all_proxy=socks5://127.0.0.1:7890"

# 设置取消使用代理
    alias unsetproxy="unset http_proxy; unset https_proxy; \
    unset all_proxy; echo 'Unset proxy successfully'"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
