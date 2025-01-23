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
    unsetopt flowcontrol # use c-s/c-q

    # You may need to manually set your language environment
    # export LC_ALL='C'
    export LANG=en_US.UTF-8

    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
        end-of-line
    )

    export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
        forward-char
        forward-word
        emacs-forward-word
    )

    ## configure Homebrew, PATH(GNU CLI tools) {
    export SHELL="/usr/local/bin/zsh"
    export PREZCUSMODIR="$HOME/.zprezto/contrib"
    export XDG_CONFIG_HOME="$HOME/.config"

    export PNPM_HOME="$HOME/.pnpm"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/go/bin:$HOME/.bun/bin:$HOME/.cargo/bin:$PATH"
    export MANPATH="/usr/local/man:/usr/local/share/man:${MANPATH}"
    export MANPATH="/usr/local/opt/coreutils/share/man:${MANPATH}"
    ## }

    ## ------ VIM environment config ----------------- {
    export EDITOR="nvim"
    export VISUAL="nvim"
    export VIM="/usr/local/opt/neovim/share/nvim"
    export VIMRUNTIME="${HOME}/.nvim/runtime"
    ## }

    ## ------ Bat && fd & fzf configuration ---------- {
    if [[ -n $(command -v bat) ]]; then
        export BATDIFF_USE_DELTA=true
        export BAT_THEME="Catppuccin Mocha"
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
        export MANROFFOPT='-c'
    fi

    if [[ -n $(command -v fd) ]]; then
        export FD_OPTIONS=" \
            --exclude .git
            --exclude .idea
            --exclude .venv
            --exclude node_modules"
    fi

    if [[ -n $(command -v fzf) ]]; then
        export FZF_DEFAULT_COMMAND="fd -H --type f ${FD_OPTIONS}"
        export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
        export FZF_CTRL_R_OPTS="
            --color header:italic
            --wrap --wrap-sign $'\t↳ '
            --bind 'ctrl-x:track+clear-query'
            --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
            --header '[CTRL-y: copy into clipboard] [CTRL-x: clear-query]'"

        export FZF_CTRL_T_OPTS="
            --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- |pbcopy)+accept'
            --bind 'alt-e:become(nvim {} > /dev/tty)+abort'
            --preview-window=right:70%:wrap --preview
            '(bat --style=numbers --color=always --line-range=:100 {} ) 2>/dev/null'"

        export FZF_DEFAULT_OPTS="
            -0 --cycle --multi --height 70% --reverse --border --tiebreak=begin
            --bind end:preview-down,home:preview-up,?:toggle-preview
            --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'
            --bind 'alt-a:select-all'"
    fi
    ## }

    ## bindings {
    bindkey -e

    bindkey -e '^x^e' edit-command-line

    # ------ Ctrl-x ctrl-s, sudo
    sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
        zle end-of-line
    }
    zle -N sudo-command-line
    bindkey -e '^x^s' sudo-command-line

    # Use Ctrl-x Ctrl-v to get the output of the last command
    copy-last-command-output() {
        # LBUFFER+="$(eval ${history[$((HISTCMD - 1))]})"
        /bin/echo "$(eval ${history[$((HISTCMD - 1))]})" | pbcopy
    }
    zle -N copy-last-command-output
    bindkey -e "^x^v" copy-last-command-output

    # Ctrl-x Ctrl-d copies line to global pasteboard
    pb-kill-buffer-line() {
        zle kill-buffer
        /bin/echo $CUTBUFFER | pbcopy
    }
    zle -N pb-kill-buffer-line
    bindkey -e '^x^d' pb-kill-buffer-line

    # ------ Ctrl-u
    pb-backward-kill-line() {
        zle backward-kill-line
        /bin/echo $CUTBUFFER | pbcopy
    }
    zle -N pb-backward-kill-line
    bindkey -e '^u' pb-backward-kill-line

    # ------ Ctrl-k
    pb-forward-kill-line() {
        zle kill-line
        /bin/echo "${CUTBUFFER}" | pbcopy
    }
    zle -N pb-forward-kill-line
    bindkey -e '^k' pb-forward-kill-line
    ## }

    # zsh-defer
    [[ -f "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh" ]] && {
        source "${PREZCUSMODIR}/zsh-defer/zsh-defer.plugin.zsh"
    }

    # API secret:
    [ -f ~/.secrets ] && zsh-defer source ~/.secrets

    # aliases.zsh conf:
    [ -f ~/.aliases.zsh ] && zsh-defer source ~/.aliases.zsh

    # bun completions
    # [ -s "~/.bun/_bun" ] && zsh-defer  source "~/.bun/_bun"

    # atuin shell history search
    # [[ -e $(which atuin) ]] && {
    #     export ATUIN_NOBIND="true"
    #     bindkey '^q' atuin-search
    #     zsh-defer source ${PREZCUSMODIR}/user_plugins/atuin.zsh
    # }

    # fzf
    [[ -e $(which fzf) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/fzf.zsh

    # zoxide
    [[ -e $(which zoxide) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/zoxide.zsh

    # Git status
    # "$(scmpuff init --shell="zsh" --aliases=false)"
    [[ -e $(which scmpuff) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/scmpuff.zsh

    # starship prompt
    [[ -e $(which starship) ]] && source ${PREZCUSMODIR}/user_plugins/starship_prompt.zsh

    # direnv
    # [[ -e $(which direnv) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/direnv.zsh

    # auto-venv
    [[ -f "${PREZCUSMODIR}/auto-venv/auto-venv.plugin.zsh" ]] && {
        zsh-defer source "${PREZCUSMODIR}/auto-venv/auto-venv.plugin.zsh"
    }

    # fzf-tab
    [[ -f "${PREZCUSMODIR}/fzf-tab/fzf-tab.plugin.zsh" ]] && {
        source "${PREZCUSMODIR}/fzf-tab/fzf-tab.plugin.zsh"
    }

    # zsh-autopair
    [[ -f "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" ]] && {
        source "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" && autopair-init
    }

    ## fzf-tab config {
    zstyle -d ':completion:*' format
    zstyle ':fzf-tab:*' fzf-min-height 10
    zstyle ':fzf-tab:*' popup-min-size 60 30
    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ":fzf-tab:*" fzf-flags --color=bg+:23
    zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
    zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a1 --icons --color=always $realpath'
    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-flags --preview-window=right:70%:wrap
    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-preview 'bat --style=numbers,header --color=always $realpath'
    ## }

fi
