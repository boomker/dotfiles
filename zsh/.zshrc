# Executes commands at the start of an interactive session.

if [[ $- =~ i ]]; then

    export SHELL="/usr/local/bin/zsh"
    export PREZCUSMODIR="$HOME/.zprezto-contrib"

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    # prompt
    [[ -e $(which starship) ]] && source ${PREZCUSMODIR}/user_plugins/starship_prompt.zsh

    # 延迟执行或加载zsh 命令或脚本
    # git clone https://github.com/romkatv/zsh-defer.git ${PREZCUSMODIR}/
    if [[ -f "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh" ]]; then
        source "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh"
    fi

    # API secret:
    [ -f ~/.secrets ] && zsh-defer source ~/.secrets

    # alias.zsh conf:
    [ -f ~/.alias.zsh ] && zsh-defer source ~/.alias.zsh

    # bun completions
    # [ -s "~/.bun/_bun" ] && zsh-defer source "~/.bun/_bun"

    # direnv
    [ -f ~/.alias.zsh ] && zsh-defer source ${PREZCUSMODIR}/user_plugins/direnv.zsh

    # zoxide config:
    [[ -e $(which zoxide) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/zoxide.zsh

    # Git status
    # [[ -e $(which scmpuff) ]] && zsh-defer eval "$(scmpuff init --shell="zsh")"

    # shell history search
    export ATUIN_NOBIND="true"
    bindkey '^q' atuin-search
    [[ -e $(which atuin) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/atuin.zsh

    [[ -e $(which fzf) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/fzf.zsh

    #[ -f "${HOME}/.fzf-git.sh" ] && zsh-defer source "${HOME}/.fzf-git.sh"

    # zsh-autopair
    # git@github.com:hlissner/zsh-autopair.git
    # [ -f "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" ] && [[ -n ${TERM_PROGRAM} ]] &&
    #     source "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" && autopair-init

    # zsh-notify
    # git@github.com:marzocchi/zsh-notify.git
    [ -f "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh" ] && [[ -n ${TERM_PROGRAM} ]] &&
        zsh-defer source "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh"

    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    # export SDKMAN_DIR="${HOME}/.sdkman"
    # [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && zsh-defer source "${HOME}/.sdkman/bin/sdkman-init.sh"

    # broot configure
    # [ -f "${HOME}/.config/broot/launcher/bash/br" ] && zsh-defer source "${HOME}/.config/broot/launcher/bash/br"

fi

# Customize to your needs...

## --------------User configuration--------------
# You may need to manually set your language environment
# export LC_ALL='C'
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# 以下字符视为单词的一部分
WORDCHARS='*?[]~&;!#$%^(){}<>'
HIST_STAMPS="mm/dd/yyyy"

## configure pyvenv, Homebrew, PATH(GNU CLI tools), catalog ,git on MacOS {{{
if [[ $(uname -s) == "Darwin" ]]; then

    ## HomeBrew more fast conf:
    # export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    # export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    # export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    # export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    # export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    # export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

    # GNU cmd tools PATH for Mac:
    export PNPM_HOME="$HOME/.pnpm"
    export PIPX_HOME="$HOME/.pipx"
    export PATH="$HOME/go/bin:$HOME/.bun/bin:$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/.local/bin:$HOME/.version-fox/shims:$PATH"
    export PIPX_DEFAULT_PYTHON="$HOME/.version-fox/shims/python3"
    export MANPATH="/usr/local/man:/usr/local/share/man:${MANPATH}"
    export MANPATH="/usr/local/opt/coreutils/share/man:${MANPATH}"

fi
## }}}

## ------------VIM environment path config----------------- {{{
export EDITOR="nvim"
export VIM="/usr/local/opt/neovim/share/nvim"
export VIMRUNTIME="${HOME}/.nvim/runtime"
# }}}

# -------------JDK/Tomcat Path---------------------------- {{{
# export JAVA_HOME=/usr/local/opt/java
# export TOMCAT_HOME=/opt/tomcat8
# export CATALINA_HOME=$TOMCAT_HOME
# export CLASSPATH=.:${JAVA_HOME}/libexec/openjdk.jdk/Contents/Home/lib
# export CLASSPATH=.:${JAVA_HOME}/lib:${CATALINA_HOME}/lib
# export PATH=${JAVA_HOME}/bin:$PATH
# }}}

# ------Bat && fd & fzf configuration----------
export BAT_THEME="Coldark-Dark"
export BATDIFF_USE_DELTA=true

export FD_OPTIONS=" --follow \
                    --exclude .git \
                    --exclude .idea \
                    --exclude .venv \
                    --exclude node_modules"

export FZF_DEFAULT_COMMAND="fd -H --type f --type l ${FD_OPTIONS}"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

export FZF_CTRL_R_OPTS="
        --bind 'ctrl-/:toggle-preview'
        --bind 'ctrl-x:track+clear-query'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
        --color header:italic
        --wrap --wrap-sign $'\t↳ '
        --preview 'echo {}' --preview-window up:3:hidden:wrap
        --header 'Press CTRL-Y to copy command into clipboard; CTRL-x clear-query'"

export FZF_CTRL_T_OPTS="
        --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- |pbcopy)+accept' \
        --bind 'alt-e:become(nvim {} > /dev/tty)+abort' \
        --preview-window=right:70%:wrap --preview \
        '(bat --style=numbers --color=always --line-range=:100 {} ) 2>/dev/null'"

export FZF_ALT_C_OPTS="--preview-window=right:70%:wrap --preview \
        '(eza -ahlF --color-scale --group-directories-first  --icons \
        --color=always --tree --level=2  -I=\".git*\" {}) 2>/dev/null |head -20'"

export FZF_DEFAULT_OPTS=" --exact --multi --ansi --height 70% --reverse --border --tiebreak=begin \
        --bind end:preview-down,home:preview-up,?:toggle-preview \
        --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
        --bind 'alt-a:select-all+accept'"

setopt globdots  # Include hidden files. or: _comp_options+=(globdots)
setopt auto_menu # show completion menu on successive tab press
setopt always_to_end
setopt complete_in_word

export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
)

export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char
    forward-word
    emacs-forward-word
)

# Emacs风格键绑定
bindkey -e

# edit command line like in bash (zsh has 'fc' but it has to execute the command first)
# autoload -z edit-command-line
# zle -N edit-command-line
# bindkey "^X^E" edit-command-line

# Use Ctrl-x Ctrl-v to get the output of the last command
insert-last-command-output() {
    LBUFFER+="$(eval ${history[$((HISTCMD - 1))]})"
}
zle -N insert-last-command-output
bindkey "^X^V" insert-last-command-output

# Ctrl-x Ctrl-w copies word to global pasteboard
pb-cut-word-region() {
    zle copy-region-as-kill
    gecho $CUTBUFFER | pbcopy
}
zle -N pb-cut-word-region
bindkey -e '^x^w' pb-cut-word-region

# Ctrl-x Ctrl-d copies line to global pasteboard
pb-kill-buffer-line() {
    zle kill-buffer
    gecho $CUTBUFFER | pbcopy
}
zle -N pb-kill-buffer-line
bindkey -e '^x^d' pb-kill-buffer-line

# ------ Ctrl-u
pb-backward-kill-line() {
    zle backward-kill-line
    gecho $CUTBUFFER | pbcopy
}
zle -N pb-backward-kill-line
bindkey -e '^u' pb-backward-kill-line

# ------ Ctrl-k
pb-forward-kill-line() {
    zle kill-line
    gecho "${CUTBUFFER}" | pbcopy
}
zle -N pb-forward-kill-line
bindkey -e '^k' pb-forward-kill-line

# ------ Ctrl-xs, sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey -e '^xs' sudo-command-line
bindkey "^[[A" history-beginning-search-backward

# zsh-notify config
zstyle ':notify:*' check-focus no
zstyle ':notify:*' enable-on-ssh yes
zstyle ':notify:*' command-complete-timeout 15
# zstyle ':notify:*' notifier "/usr/local/bin/noti"
zstyle ':notify:*' error-sound "Bubble"
zstyle ':notify:*' error-title "⛔️ errored in #{time_elapsed}"
zstyle ':notify:*' blacklist-regex 'git|man|vim|nvim|neovim|help|bat'
# zstyle ':notify:*' error-icon "https://s1.ax1x.com/2022/11/06/xXY9o9.png"
# zstyle ":notify:*" success-icon "https://s1.ax1x.com/2022/11/06/xXYpdJ.png"
zstyle ':notify:*' success-sound "Crystal"
zstyle ':notify:*' success-title "✅ finished in #{time_elapsed}"
zstyle ':notify:*' always-notify-on-failure no

# fzf-tab config:

zstyle ':fzf-tab:complete:bat:argument-rest' fzf-preview \
    'bat --theme=Coldark-Dark --style=numbers,header --color=always $realpath'
zstyle ':fzf-tab:complete:bat:argument-rest' fzf-flags --preview-window=right:70%:wrap

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a1 --icons --color=always $realpath'

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group =~ "process" ]] && ps \
        -p $word -o command -w -w |tail -1'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# brew
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):argument-rest' fzf-flags --preview-window=right:70%:wrap
