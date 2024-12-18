# Executes commands at the start of an interactive session.

if [[ $- =~ i ]]; then

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi

    ## --------------User configuration--------------
    WORDCHARS='*?[]~&;!#$%^(){}<>'

    # Include hidden files
    setopt globdots
    setopt auto_menu
    setopt always_to_end
    setopt complete_in_word

    # You may need to manually set your language environment
    # export LC_ALL='C'
    export LANG=en_US.UTF-8
    export XDG_CONFIG_HOME="$HOME/.config"

    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
        end-of-line
    )

    export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
        forward-char
        forward-word
        emacs-forward-word
    )

    ## configure pyvenv, Homebrew, PATH(GNU CLI tools), git on MacOS {{{
    # if [[ $(uname -s) == "Darwin" ]]; then fi
    export SHELL="/usr/local/bin/zsh"
    export PREZCUSMODIR="$HOME/.zprezto-contrib"

    export PNPM_HOME="$HOME/.pnpm"
    export PIPX_HOME="$HOME/.pipx"
    export PATH="$HOME/go/bin:$HOME/.bun/bin:$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/.local/bin:$HOME/.version-fox/shims:$PATH"
    export PIPX_DEFAULT_PYTHON="$HOME/.version-fox/shims/python3"
    export MANPATH="/usr/local/man:/usr/local/share/man:${MANPATH}"
    export MANPATH="/usr/local/opt/coreutils/share/man:${MANPATH}"
    ## }}}

    ## ------ VIM environment config ----------------- {{{
    export EDITOR="nvim"
    export VIM="/usr/local/opt/neovim/share/nvim"
    export VIMRUNTIME="${HOME}/.nvim/runtime"
    # }}}

    ## ------ Bat && fd & fzf configuration ---------- {{{
    if (( $+commands[bat] )); then
        export BAT_THEME="Coldark-Dark"
        export BATDIFF_USE_DELTA=true
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
        export MANROFFOPT='-c'
    fi

    if (( $+commands[fd] )); then
        export FD_OPTIONS=" \
            --exclude .git \
            --exclude .idea \
            --exclude .venv \
            --exclude node_modules"
    fi

    if (( $+commands[fzf] )); then
        export FZF_DEFAULT_COMMAND="fd -H --type f ${FD_OPTIONS}"
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
            --color=always --tree --level=2 -I=.git* {}) 2>/dev/null |head -20'"

        export FZF_DEFAULT_OPTS=" \
            --exact --multi --ansi --height 70% --reverse --border --tiebreak=begin \
            --bind end:preview-down,home:preview-up,?:toggle-preview \
            --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
            --bind 'alt-a:select-all+accept'"
    fi
    ## }}}

    ## bindings {{{
    bindkey -e

    # ------ Ctrl-x ctrl-s, sudo
    sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
        zle end-of-line
    }
    zle -N sudo-command-line
    bindkey -e '^x^s' sudo-command-line

    # Use Ctrl-x Ctrl-v to get the output of the last command
    insert-last-command-output() {
        LBUFFER+="$(eval ${history[$((HISTCMD - 1))]})"
    }
    zle -N insert-last-command-output
    bindkey -e "^x^v" insert-last-command-output

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
    ## }}}

    ## zsh-notify config {{{
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
    ## }}}

    ## fzf-tab config {{{
    zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ':fzf-tab:*' fzf-min-height 30
    zstyle ':fzf-tab:*' popup-min-size 60 30
    zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 30
    # zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-a:toggle-all'

    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:descriptions' format '[%d]'
    # zstyle ':completion:*:*:*:*:*' menu yes select

    # use input as query string when completing zlua
    # zstyle ':fzf-tab:complete:_zlua:*' query-string input

    # preview directory's content with eza when completing cd
    zstyle ':fzf-tab:complete:z:*' popup-pad 30 0
    zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -a1 --icons --color=always $realpath'

    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-preview \
        'bat --theme=Coldark-Dark --style=numbers,header --color=always $realpath'
    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-flags --preview-window=right:70%:wrap

    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview "git log --color=always ${word%% *}"
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'

    # give a preview of commandline arguments when completing `kill`
    zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
        '[[ $group =~ "process" ]] && ps -p $word -o command -w -w |tail -1'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
    ## }}}

    # API secret:
    [ -f ~/.secrets ] && zsh-defer source ~/.secrets

    # alias.zsh conf:
    [ -f ~/.alias.zsh ] && zsh-defer source ~/.alias.zsh

    # bun completions
    # [ -s "~/.bun/_bun" ] && zsh-defer source "~/.bun/_bun"

    # shell history search
    [[ -e $(which atuin) ]] && {
        export ATUIN_NOBIND="true"
        bindkey '^q' atuin-search
        zsh-defer source ${PREZCUSMODIR}/user_plugins/atuin.zsh
    }

    # fzf
    [[ -e $(which fzf) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/fzf.zsh

    # zoxide config:
    [[ -e $(which zoxide) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/zoxide.zsh

    # starship prompt
    [[ -e $(which starship) ]] && source ${PREZCUSMODIR}/user_plugins/starship_prompt.zsh

    # direnv
    # [[ -e $(which direnv) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/direnv.zsh

    # Git status
    # [[ -e $(which scmpuff) ]] && zsh-defer eval "$(scmpuff init --shell="zsh")"

    # [ -f "${HOME}/.fzf-git.sh" ] && zsh-defer source "${HOME}/.fzf-git.sh"

    # zsh-autopair
    # git@github.com:hlissner/zsh-autopair.git
    [ -f "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" ] && autopair-init

    # zsh-defer
    # git clone https://github.com/romkatv/zsh-defer.git
    # [[ -f "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh" ]] && {
    #     source "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh"
    # }

    # zsh-notify
    # git@github.com:marzocchi/zsh-notify.git
    # [ -f "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh" ] && [[ -n ${TERM_PROGRAM} ]] &&
    #     zsh-defer source "${PREZCUSMODIR}/zsh-notify/notify.plugin.zsh"

fi
