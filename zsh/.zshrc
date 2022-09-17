# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Executes commands at the start of an interactive session.


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autoload -Uz promptinit
# promptinit
# prompt powerlevel10k


export PREZCUSMODIR="$HOME/.zprezto-contrib"
# 延迟执行或加载zsh 命令或脚本
# git clone https://github.com/romkatv/zsh-defer.git ${PREZCUSMODIR}/
source ${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh

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
    export PATH="/usr/local/sbin:$HOME/.yarn/bin:~/.cargo/bin/:$PATH"
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


# ------fzf & fd & bat configuration----------
  [ -f ~/.fzf.zsh ] && zsh-defer source ~/.fzf.zsh
    export BAT_THEME="TwoDark"
    export FD_OPTIONS="--follow --exclude .git --exclude .idea --exclude node_modules --exclude venv"
    export FZF_DEFAULT_COMMAND="fd -H --type f --type l ${FD_OPTIONS}"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_CTRL_T_OPTS="--preview-window=right:70%:wrap --preview '(bat --style=numbers --color=always {}) 2> /dev/null | head -100'"
    export FZF_DEFAULT_OPTS='--height 70% --reverse --border'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && zsh-defer source "${HOME}/.sdkman/bin/sdkman-init.sh"

# broot configure
[ -f "${HOME}/.config/broot/launcher/bash/br" ] && zsh-defer source ${HOME}/.config/broot/launcher/bash/br


# iterm2_shell_integration configuration:
test -e "${HOME}/.iterm2_shell_integration.zsh" && zsh-defer source "${HOME}/.iterm2_shell_integration.zsh"


# nvm config:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="/usr/local/opt/nvm"
zsh-defer -c '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm
export NVM_LAZY_LOAD=true
[ -f "${PREZCUSMODIR}/zsh-nvm/zsh-nvm.plugin.zsh" ] && zsh-defer source "${PREZCUSMODIR}/zsh-nvm/zsh-nvm.plugin.zsh"


# zsh-z config:
# [ -f "${PREZCUSMODIR}/zsh-z/zsh-z.plugin.zsh" ] && zsh-defer source "${PREZCUSMODIR}/zsh-z/zsh-z.plugin.zsh"
[[ -e $(which zoxide) ]] && eval "$(zoxide init zsh)"


# 设置使用代理
  alias setproxy="export https_proxy=http://127.0.0.1:7890; \
      export http_proxy=http://127.0.0.1:7890; \
      export all_proxy=socks5://127.0.0.1:7890"

# 设置取消使用代理
    alias unsetproxy="unset http_proxy; unset https_proxy; \
    unset all_proxy; echo 'Unset proxy successfully'"


# Emacs风格 键绑定
bindkey -e
bindkey '^u' backward-kill-line
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
    vi-end-of-line
    vi-add-eol
)

export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char
    forward-word
    emacs-forward-word
    vi-forward-word
    vi-forward-word-end
    vi-forward-blank-word
    vi-forward-blank-word-end
    vi-find-next-char
    vi-find-next-char-skip
)


# 以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# export LESSOPEN="| $(which highlight) %s --out-format xterm256 -l --force -s solarized-light --no-trailing-nl"
# export LESS=" -R"
# alias less='less -m -N -g -i -J --line-numbers --underline-special'
# alias more='less'
