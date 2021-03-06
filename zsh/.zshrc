# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  [[ $- =~ i ]] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Executes commands at the start of an interactive session.


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# only interactive shell source p10k theme

export PREZCUSMODIR="$HOME/.zprezto-contrib"
if [[ $- =~ i ]]; then

    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
         source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    # 延迟执行或加载zsh 命令或脚本
    # git clone https://github.com/romkatv/zsh-defer.git ${PREZCUSMODIR}/
    if [[ -f "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh" ]]; then
        source "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh"
    fi

    # alias.zsh conf:
    [ -f ~/.alias.zsh ]  && zsh-defer source ~/.alias.zsh
    [ -f ~/.fzf.zsh ] && zsh-defer source ~/.fzf.zsh
    [ -f "${HOME}/.fzf-git.sh" ] && zsh-defer source "${HOME}/.fzf-git.sh"

    # nvm config:
    # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    export NVM_DIR="/usr/local/opt/nvm"
    zsh-defer -c '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm
    export NVM_LAZY_LOAD=true
    [ -f "${PREZCUSMODIR}/zsh-nvm/zsh-nvm.plugin.zsh" ] && zsh-defer source "${PREZCUSMODIR}/zsh-nvm/zsh-nvm.plugin.zsh"

    # zoxide config:
    [[ -e $(which zoxide) ]] && eval "$(zoxide init zsh)"

    # zsh-notify
    [ -f "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh" ] && [[ -n ${TERM_PROGRAM} ]] && \
        [[ ${TERM_PROGRAM} != 'vscode' ]] && source "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh"

    # zsh-autopair
    [ -f "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" ] && [[ -n ${TERM_PROGRAM} ]] && \
        source "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" && autopair-init

fi

# autoload -Uz promptinit
# promptinit
# prompt powerlevel10k


# Customize to your needs...


## --------------User configuration--------------
# You may need to manually set your language environment
export LANG=en_US.UTF-8
HIST_STAMPS="mm/dd/yyyy"

# 以下字符视为单词的一部分
WORDCHARS='*?[]~&;!#$%^(){}<>'

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
    export PATH="/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/opt/python/bin:${PATH}"
    export PATH="/usr/local/sbin:${HOME}/.yarn/bin:${HOME}/.cargo/bin:${HOME}/go/bin:$PATH"
    export MANPATH="/usr/local/man:/usr/local/share/man:${MANPATH}"
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

## ------------VIM environment path config----------------- {{{
    export EDITOR="$(which nvim)"
    export VIM="/usr/local/opt/neovim/share/nvim"
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


# ------fzf & fd & bat configuration----------
    export BAT_THEME="Catppuccin-mocha"
    export FD_OPTIONS="--follow --exclude .git --exclude .idea --exclude node_modules --exclude venv"
    export FZF_DEFAULT_COMMAND="fd -H --type f --type l ${FD_OPTIONS}"
    export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

        # --bind 'ctrl-v:execute-silent(${EDITOR:-vscode} {})+cancel' \
    export FZF_CTRL_T_OPTS="
        --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- |pbcopy)+accept' \
        --preview-window=right:70%:wrap --preview \
        '(bat --style=numbers --color=always --line-range=:100 {} ) 2>/dev/null'"

    export FZF_ALT_C_OPTS="--preview-window=right:70%:wrap --preview \
        '(exa -ahlF --color-scale --group-directories-first  --icons \
        --color=always --tree --level=2  -I=\".git*\" {}) 2>/dev/null |head -20'"

    export FZF_DEFAULT_OPTS=" --exact --multi --ansi --height 70% --reverse --border --tiebreak=begin \
        --bind end:preview-down,home:preview-up,?:toggle-preview \
        --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort',alt-a:select-all+accept"



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="${HOME}/.sdkman"
# [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && zsh-defer source "${HOME}/.sdkman/bin/sdkman-init.sh"

# broot configure
# [ -f "${HOME}/.config/broot/launcher/bash/br" ] && zsh-defer source "${HOME}/.config/broot/launcher/bash/br"

# iterm2_shell_integration configuration:
# test -e "${HOME}/.iterm2_shell_integration.zsh" && zsh-defer source "${HOME}/.iterm2_shell_integration.zsh"

# Emacs风格 键绑定
bindkey -e
# bindkey '^u' backward-kill-line
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
)

export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char
    forward-word
    emacs-forward-word
)

setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
setopt globdots          # Include hidden files. or: _comp_options+=(globdots)

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
pb-copy-region-as-kill() {
    zle copy-region-as-kill
    print -rn $CUTBUFFER | pbcopy
}
zle -N pb-copy-region-as-kill
bindkey -e '^x^w' pb-copy-region-as-kill

# Ctrl-x Ctrl-d copies to global pasteboard as well as zsh clipboard - is this overkill?
pb-kill-buffer() {
    zle kill-buffer
    print -rn $CUTBUFFER | pbcopy
}
zle -N pb-kill-buffer
bindkey -e '^x^d' pb-kill-buffer

# ------ Ctrl-u
pb-backward-kill-line() {
    zle backward-kill-line
    print -rn $CUTBUFFER | pbcopy
}
zle -N pb-backward-kill-line
bindkey -e '^u' pb-backward-kill-line

# ------ Ctrl-k
pb-kill-line() {
    zle kill-line
    print -rn $CUTBUFFER | pbcopy
}
zle -N pb-kill-line
bindkey -e '^k' pb-kill-line

# ------ Ctrl-xs
sudo-command-line() {
    [[ -z $BUFFER  ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey -e '^xs' sudo-command-line


# zsh-notify config
    zstyle ':notify:*' command-complete-timeout 15
    zstyle ':notify:*' enable-on-ssh yes
    zstyle ':notify:*' check-focus no
    zstyle ':notify:*' blacklist-regex 'git|man|vim|nvim|neovim|help|glow'
    # zstyle ':notify:*' notifier "/usr/local/bin/noti"
    zstyle ':notify:*' error-icon "https://s1.ax1x.com/2022/11/06/xXY9o9.png"
    zstyle ':notify:*' error-sound "Bubble"
    zstyle ':notify:*' error-title "⛔️ errored in #{time_elapsed}"
    zstyle ":notify:*" success-icon "https://s1.ax1x.com/2022/11/06/xXYpdJ.png"
    zstyle ':notify:*' success-sound "Crystal"
    zstyle ':notify:*' success-title "✅ finished in #{time_elapsed}"
    zstyle ':notify:*' always-notify-on-failure no

# fzf-tab config:
    # zstyle ':fzf-tab:*' fzf-flags --ansi
    # zstyle ':completion:*' group-name ''
    zstyle ':fzf-tab:complete:(bat|exa|ls):argument-rest' fzf-preview '\
        [[ -f $realpath && ! $word =~ ".git*" ]] && \
        bat  --style=numbers,header --color=always $realpath || \
        exa -ahlF --color-scale --group-directories-first --no-permissions --no-user \
        --time-style=iso --icons --color=always --tree --level=2  -I=".git*" $realpath'
    zstyle ':fzf-tab:complete:(bat|exa|ls):argument-rest' fzf-flags --preview-window=right:70%:wrap

    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    # man 2 select
    zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'MANWIDTH=$FZF_PREVIEW_COLUMNS \
        man $word |bat -l man --color=always'

    # preview directory's content with exa when completing cd
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -a1 --icons --color=always $realpath'

    # use input as query string when completing zlua
    zstyle ':fzf-tab:complete:_zlua:*' query-string input

    # give a preview of commandline arguments when completing `kill`
    zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group =~ "process" ]] && ps \
        -p $word -o command -w -w |tail -1'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

    # brew
    zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'
