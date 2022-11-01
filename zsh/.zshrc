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
    export PATH="/usr/local/sbin:$HOME/.yarn/bin:~/.cargo/bin/:${HOME}/.iterm2:$PATH"
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
    export JAVA_HOME=/usr/local/opt/java
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
    export BAT_THEME="Monokai Extended Origin"
    export FD_OPTIONS="--follow --exclude .git --exclude .idea --exclude node_modules --exclude venv"
    export FZF_DEFAULT_COMMAND="fd -H --type f --type l ${FD_OPTIONS}"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_OPTS="--preview-window=right:70%:wrap --preview \
        '(exa -ahlF --color-scale --group-directories-first  --icons \
        --color=always --tree --level=2  -I=\".git*\" {}) 2>/dev/null |head -20'"

    export FZF_CTRL_T_OPTS="--preview-window=right:70%:wrap --preview \
        '(bat --style=numbers --color=always --line-range=:100 {}) 2> /dev/null'"
    export FZF_DEFAULT_OPTS="--ansi --height 70% --reverse \
        --border --tiebreak=begin --bind end:preview-down,home:preview-up,ctrl-a:select-all+accept"


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
# bindkey '^u' backward-kill-line
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

# edit command line like in bash (zsh has 'fc' but it has to execute the command first)
# autoload -z edit-command-line
# zle -N edit-command-line
# bindkey "^X^E" edit-command-line

# Use Ctrl-x,Ctrl-v to get the output of the last command
insert-last-command-output() {
    LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^X^V" insert-last-command-output

# Ctrl-x,Ctrl-w copies to global pasteboard as well as zsh clipboard
pb-copy-region-as-kill () {
    zle copy-region-as-kill
    print -rn $CUTBUFFER | pbcopy
  }
zle -N pb-copy-region-as-kill
bindkey -e '^x^w' pb-copy-region-as-kill

# Ctrl-x Ctrl-d copies to global pasteboard as well as zsh clipboard - is this overkill?
pb-kill-buffer () {
    zle kill-buffer
    print -rn $CUTBUFFER | pbcopy
  }
zle -N pb-kill-buffer
bindkey -e '^x^d' pb-kill-buffer

# ------ Ctrl-u
pb-backward-kill-line () {
    zle backward-kill-line
    print -rn $CUTBUFFER | pbcopy
}
zle -N pb-backward-kill-line
bindkey -e '^u' pb-backward-kill-line

# ------ Ctrl-k
pb-kill-line () {
    zle kill-line
    print -rn $CUTBUFFER | pbcopy
  }
zle -N pb-kill-line
bindkey -e '^k' pb-kill-line


# 以下字符视为单词的一部分
WORDCHARS='*?[]~&;!#$%^(){}<>'

# eval "$(scmpuff init -s --aliases=false)"
# export LESSOPEN="| $(which highlight) --out-format xterm256 -l --force -s solarized-light --no-trailing-nl"
# export LESS=" -R"
# alias less='less -m -N -g -i -J --line-numbers --underline-special'
# alias more='less'

[ -f "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh" ] && zsh-defer source "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh"

# notify
    zstyle ":notify:*" command-complete-timeout 15
    zstyle ':notify:*' expire-time 2500
    zstyle ":notify:*" enable-on-ssh yes
    # zstyle ":notify:*" error-icon "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Blokkade.png/240px-Blokkade.png"
    zstyle ":notify:*" error-sound "Sosumi"
    zstyle ":notify:*" error-title "⛔️ errored in #{time_elapsed}"
    # zstyle ":notify:*" success-icon "https://upload.wikimedia.org/wikipedia/commons/a/a6/Green_approved.png"
    zstyle ":notify:*" success-sound "Blow"
    zstyle ":notify:*" success-title "✅ finished in #{time_elapsed}"


# fzf-tab config:
# zstyle ':fzf-tab:*' fzf-flags --ansi
# zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format "%F{yellow}--- %d%f"

zstyle ':fzf-tab:complete:bat:argument-rest' fzf-preview '[[ -f $realpath ]] && \
    bat --color=always $realpath || \
    exa -ahlF --color-scale --group-directories-first --no-permissions --no-user \
    --time-style=iso --icons --color=always --tree --level=2  -I=".git*" $realpath'
zstyle ':fzf-tab:complete:bat:argument-rest' fzf-flags --preview-window=right:70%:wrap

zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -ahlF --color-scale --group-directories-first \
    --no-permissions --octal-permissions --no-user --time-style=iso --icons --color=always \
    --tree --level=2  -I=".git*" $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-flags --preview-window=right:70%:wrap

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# man 2 select
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'MANWIDTH=$FZF_PREVIEW_COLUMNS \
    man $word 2>/dev/null |bat -l man --color=always'

