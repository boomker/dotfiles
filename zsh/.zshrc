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
    setopt SHARE_HISTORY
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
    export SHELL="/opt/homebrew/bin/zsh"
    export XDG_CONFIG_HOME="$HOME/.config"
    export PREZCUSMODIR="$HOME/.zprezto/contrib"
    export KAKU_ZSH_DIR="$HOME/.config/kaku/zsh"
    export LS_COLORS="$(vivid generate catppuccin-mocha)"

    export PNPM_HOME="$HOME/.pnpm"
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="/opt/zerobrew/prefix/bin:$PATH"
    export PATH="$HOME/go/bin:$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/.bun/bin:$PNPM_HOME/bin:$PATH"

    export MANPATH="/usr/local/opt/coreutils/share/man:${MANPATH}"
    export MANPATH="/usr/local/man:/usr/local/share/man:${MANPATH}"

    # Load zsh-completions into fpath before compinit
    fpath=("$PREZCUSMODIR/completions" $fpath)
    if [[ -d "$KAKU_ZSH_DIR/plugins/zsh-completions/src" ]]; then
        fpath=("$KAKU_ZSH_DIR/plugins/zsh-completions/src" $fpath)
    fi
    ## }

    ## ------ VIM environment config ----------------- {
    export EDITOR="nvim"
    export VISUAL="nvim"
    export VIMRUNTIME="${HOME}/.nvim/runtime"
    export VIM="/opt/homebrew/opt/neovim/share/nvim"
    ## }

    # OpenCode
    export Z_OC_TAB_OPENCODE_MODEL="minimax/MiniMax-M2.5"
    export Z_OC_TAB_EXPLAIN_PRINT_CMD='bat --plain --color=always --decorations=always --language=markdown --paging=never {}'

    ## ------ Bat && fd & fzf configuration ---------- {
    if [[ -n $(command -v bat) ]]; then
        export BATDIFF_USE_DELTA=true
        export BAT_THEME="Catppuccin Mocha"
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
        export MANROFFOPT='-c'
    fi

    if [[ -n $(command -v fd) ]]; then
        export FD_OPTIONS=" \
            --exclude .git \
            --exclude .idea \
            --exclude .venv \
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
        LBUFFER+="$(eval ${history[$((HISTCMD - 1))]})"
        /bin/echo "$LBUFFER" | pbcopy
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
    # [ -f ~/.secrets ] && zsh-defer source ~/.secrets

    # bun completions
    # [ -s "~/.bun/_bun" ] && zsh-defer source "~/.bun/_bun"

    [[ -d ${PREZCUSMODIR}/fzf-tab ]] && { compinit ; source ${PREZCUSMODIR}/fzf-tab/fzf-tab.plugin.zsh }

    ## fzf-tab config {
    zstyle ':completion:*' menu no
    zstyle ':fzf-tab:*' query-string ''
    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ':fzf-tab:*' fzf-min-height 10
    zstyle ':fzf-tab:*' popup-min-size 70 30
    zstyle ":fzf-tab:*" fzf-flags --color=bg+:23
    zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
    zstyle ':fzf-tab:*' show-group quiet # full, none
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-flags --preview-window=right:75%
    zstyle ':fzf-tab:complete:bat:argument-rest' fzf-preview \
        '[[ -f $realpath ]] && bat --color=always $realpath || eza -1 --color=always $realpath'
    ## fzf-tab config }

    # carapace completion
    # [[ -e $(which carapace) ]] && source <(carapace rg)

    # aliases
    [ -f ~/.aliases.zsh ] && zsh-defer source ~/.aliases.zsh

    # atuin shell history search
    [[ -e $(which atuin) ]] && {
        export ATUIN_NOBIND="true"
        bindkey '^q' atuin-search
        zsh-defer source ${PREZCUSMODIR}/user_plugins/atuin.zsh
        # eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"
    }

    # fzf
    [[ -e $(which fzf) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/fzf.zsh

    # zoxide
    [[ -e $(which zoxide) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/zoxide.zsh

    # direnv
    # [[ -e $(which direnv) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/direnv.zsh

    # Git status
    # "$(scmpuff init --shell="zsh" --aliases=false)"
    [[ -e $(which scmpuff) ]] && zsh-defer source ${PREZCUSMODIR}/user_plugins/scmpuff.zsh

    # zsh-opencode-tab
    [[ -d ${PREZCUSMODIR}/zsh-opencode-tab ]] && zsh-defer source "${PREZCUSMODIR}/zsh-opencode-tab/zsh-opencode-tab.plugin.zsh"

    # zsh-autopair
    [[ -f "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" ]] && {
        source "${PREZCUSMODIR}/zsh-autopair/autopair.zsh" && autopair-init
    }

    # starship prompt
    [[ -e $(which starship) ]] && source ${PREZCUSMODIR}/user_plugins/starship_prompt.zsh

fi

# [[ -f "$HOME/.config/kaku/zsh/kaku.zsh" ]] && source "$HOME/.config/kaku/zsh/kaku.zsh" # Kaku Shell Integration
