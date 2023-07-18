## alias config:

## common alias:
    alias -g G="   grep -iE"
    alias -g R="   rg "
    alias -g H="   head"
    alias -g T="   tail"
    alias -g L="   less"
    alias -g N="   nl "
    alias -g F="   fzf --ansi "
    alias -g FR="  fzf --ansi --preview-window=right:70%:wrap --preview "
    alias -g FU="  fzf --ansi --preview-window=up:70%:wrap --preview "
    alias -g J="   jq ."
    alias -g B="   bat "
    alias -g BG="  batgrep -S"
    alias -g BH="  bat --plain --language=help"
    alias -g BS="  bat --plain --language=bash"
    alias -g C="   choose "
    alias -g D="   delta -s"
    alias -g RX="  rargs"
    alias -g X="   xargs"
    alias -g P="   peco"
    # alias -g P=" parallel"
    alias -g U="   uniq"
    alias -g S="   sort"
    alias -g Y="   tee"
    alias -g W="   wc -l"
    alias -g CT="  column -t"
    alias -g NE="2> /dev/null"
    alias -g NUL="> /dev/null 2>&1"

    # woo! echo 'foo bar baz' | COL2
    alias -g COL1="awk '{ print \$1 }'"
    alias -g COL2="awk '{ print \$2 }'"
    alias -g COL3="awk '{ print \$3 }'"
    alias -g COL4="awk '{ print \$4 }'"
    alias -g COL5="awk '{ print \$5 }'"
    alias -g COL6="awk '{ print \$6 }'"
    alias -g COL7="awk '{ print \$7 }'"
    alias -g COL8="awk '{ print \$8 }'"
    alias -g COL9="awk '{ print \$9 }'"
    alias -g COL0="awk '{ print \$NF }'"

    # alias -g C0="|choose 0"
    alias -g C1=" choose 0"
    alias -g C2=" choose 1"
    alias -g C3=" choose 2"
    alias -g C4=" choose 3"
    alias -g C5=" choose 4"
    alias -g C6=" choose 5"
    alias -g C7=" choose 6"
    alias -g C8=" choose 7"
    alias -g C9=" choose 8"

    # awk 去重+合并文件内容(相当于两文件的并集，两文件去重后再合并), 而且能保证文件内容顺序
    alias auq="awk '!U[\$0]++' "
    alias bhelp='bat --plain --language=help'
    alias bch='_f(){pls show "$1"};_f'
    alias fch="tldr --list |sed -r \"s/('|\[|\])//g;s/, /\n/g\" |fzf --ansi --preview 'tldr {}'"
    alias bgrep="batgrep --hidden --glob='!.git' --color --smart-case "
    alias cprp="cp -rp --parents "
    alias bdf="batdiff --color --delta --context=3 "
    alias diff="delta "
    alias dfs="delta -s"
    alias dog="dig +noall +nocmd +answer "
    alias l.="ls -d .* --color=auto"
    alias ls="ls -p --width=80 --color=auto"
    alias ll="ls -rtlh"
    alias wl="wc -l"
    alias sei="sed -i "
    alias sen="sed -n "
    # switch root exec
    alias sre='sudo $(fc -ln -1)'
    # alias ssh="TERM=xterm-256color ssh"
    alias gpm="glow -p "

    # Git
    # alias drcwt="git --git-dir=${HOME}/gitrepos/.dotrcfiles.git/ "
    alias gib="git init --bare "
    alias gcb="git clone --bare "

    alias gaa="git add ."
    alias gcun="git config --global user.name "
    alias gcum="git config --global user.email "
    alias gcm="git commit -m "
    alias gcu="git commit --amend "
    alias gca="git commit --amend --no-edit"
    alias gce="git commit --allow-empty"
    alias gcig="git check-ignore -v"

    alias gcpn='git cherry-pick -x -m 1 '
    alias gcpa='git cherry-pick --abort'
    alias gcpc='git cherry-pick --continue'
    alias gcps="git cherry-pick --skip"

    alias grbi="git rebase -i "
    alias grba='git rebase --abort'
    alias grbc='git rebase --continue'
    alias grbs='git rebase --skip'

    alias gcl="git clone "
    alias gfc="git clone --filter=blob:none "
    alias gpom="git pull origin main || git pull origin master"
    alias gpum="git pull upstream main || git pull upstream master"
    alias gprm="git pull origin main --rebase"

    alias gsms='git submodule sync --recursive'
    alias gsmu='git submodule update --init --recursive'

    alias grmv='git remote --verbose'
    alias grma='git remote add'
    alias grmr='git remote rm'
    alias grmsu='git remote set-url'

    alias gpo="git push ||git push -u origin"
    alias gpf="git push -f"
    alias gpsu='git push --set-upstream '
    alias gpso='git push --set-upstream origin '

    alias glp="git log --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' "
    # etc. glp -n, glp 7f1b6b0..8724539
    alias glt="git log --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -10"
    alias gla="git log --all --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -20"

    alias gdf="git diff "
    # etc. git diff HEAD~24 HEAD --name-only    # 查看变更文件列表

    alias gco="git checkout "
    alias gsb="git switch "
    alias gnb="git switch -c "
    alias gdb='git branch --delete'

    alias grs="git restore "
    alias gss='eval "$(scmpuff init -s --aliases=false)" && scmpuff_status'
    alias gst="git status "
    alias gws="git status --short"
    alias gwr='git reset --hard'
    alias gwc='git clean -df'

    alias gsh='git stash'
    alias gsa='git stash apply'
    alias gsd='git stash drop'
    alias gsl='git stash list'

    alias gbf='git ls-tree -r --name-only '
    alias gli="git ls-files --others -i --exclude-standard"
    # ------ git aliases ---------

    alias fda="fd -H '.*' "
    alias fdi="fd --no-ignore-vcs --type=f "
    alias rg="rg --smart-case --glob='!.git*' "
    alias rgh="rg -. --glob='!.git*' "

    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    alias pus="pip3 install --upgrade pip"
    alias pda="pdm add "
    alias pdr="pdm run "

    alias adl="aria2c -x6 -c "
    alias zshconfig="nvim ${HOME}/gitrepos/dotfiles/zsh/.zshrc"
    alias zshreload="source ~/.zshrc"
    alias aliconf="nvim ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias alsreload="source ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias tmuxconfig="nvim ${HOME}/gitrepos/dotfiles/term_tmux/.tmux.conf"
    alias sshconf="nvim ${HOME}/.ssh/config"
    # alias vimconfig="nvim ${HOME}/gitrepos/dotfiles/nvim/.vimrc"
    # alias zip="zip -r "

#  alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]] ; then

    # 设置取消使用代理
    alias unsetproxy="unset http_proxy; unset https_proxy; \
        unset all_proxy; echo 'Unset proxy successfully'"

    alias -g PC=" |pbcopy"
    alias e="nvim"
    alias vim="nvim"
    alias o="open"
    alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias hostsconf="sudo vim /etc/hosts"
    alias brin="brew install "
    alias brci="brew install --cask "
    alias brho="brew home "
    alias lsflags="/bin/ls -lO "
    alias ls="exa --color=automatic"
    alias l="exa --git --icons --color=automatic --git-ignore"
    alias ll="exa -abghlF --color-scale --group-directories-first --git --icons --color=automatic --git-ignore"
    alias la="exa -abghlF --color-scale --group-directories-first --git --icons --color=automatic"
    # alias lt="ll --tree --level=2 -I='.git'"
    alias plp="plutil -p "

    alias rm="trash"
    alias rmls="trash-list"
    alias rmrs="trash-restore"
    alias rmcl="trash-empty"
    alias mkdir="gmkdir -pv "
    alias tailf="gtail -f"
    # alias grep="grep -iE --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias dfh="/usr/local/bin/gdf -Th"
    alias lstcp="lsof -nP -iTCP"
    # alias ping="prettyping"
    # alias pps="ptipython3"
    alias ips="ipython3"
    alias kubectl="kubecolor"
else
    # alias for *unix
    alias open="xdg-open"
    alias free="free -htw"
    alias pc="xsel --clipboard --input"
    alias pp="xsel --clipboard --output"
    alias mmi="make -j2&&make install"
    alias dstat="dstat -cdlmnpsy"
fi


# shell funcs

    function help() {
        "$@" --help 2>&1 |bat --plain --language=help
    }

    function zpupdate() {
        zprezto-update
        cd $ZPREZTODIR && git pull ||break 2>/dev/null
        git submodule sync --recursive
        git submodule update --init --recursive
        cd -
        for i in $(\ls -1d $PREZCUSMODIR/*); do
            git -C $i pull
        done
    }

    # fzf with brew install
    function fbih() {
        local token
        token=$(brew search "$1" | fzf-tmux --query="$1" -m -e --preview 'brew info {}')

        if [ "x$token" != "x" ]; then
            echo "(I)nstall or open the (h)omepage of $token"
            read -r input
            if [ "$input" = "i" ] || [ "$input" = "I" ]; then
                brew install "$token"
            fi
            if [ "$input" = "h" ] || [ "$input" = "H" ]; then
                brew home "$token"
            fi
        fi
    }

    # fzf with brew upgrade
    function fbuh() {
        local initial_query token
        local -a pickers
        initial_query="${*:-}"
        token=$(brew outdated |awk '$0 !~ /pin/{print $1}' | \
            fzf-tmux \
            --query="$initial_query" \
            -m -e \
            --preview 'brew info {}')
        pickers=($(echo "${token}" |tr "\n" " "))
        if [ "x$pickers" != "x" ]; then
            echo "(u)pgrade or open the (h)omepage of $pickers"
            read -r input
            if [ "$input" = "u" ] || [ "$input" = "U" ]; then
                brew upgrade "${pickers[@]}"
            fi
            if [ "$input" = "h" ] || [ "$input" = "H" ]; then
                brew home "${pickers[@]}"
            fi
        fi
    }

    function ftsh() {
        local initial_query token
        local -a pickers
        initial_query="${*:-}"
        token=$(awk 'NR==FNR&&$1~/^Host/{print $2};{if(NR!=FNR&&$1~/[0-9.]+/){print $1}}' ~/.ssh/config ~/.ssh/known_hosts |\
            rg -v 'localhost|:' |sort -u | \
            fzf-tmux \
            --query="$initial_query" \
            -w60% -h60% -m -e -0 --border --ansi
            )
        pickers=($(echo "${token}" |tr "\n" " "))
        if [ "x$token" != "x" ] && [[ "${#pickers}" == 1 ]]; then
            if [[ "${token}" =~ ^[0-9.]+ ]] then
                tssh root@"${token}"
            else
                tssh "${token}"
            fi
        else
            for i in "${pickers[@]}";do
                [[ "${i}" =~ ^[0-9.]+ ]] && tmux new-window "tssh root@$i" || tmux new-window -n "$i" "tssh $i"
            done
        fi
    }

    # exa(ls) with `tree` of option
    function lt () {
        [[ "${1}" == -l ]] && {
            exa_extra_parameter=("-bghlF" "--group-directories-first" "--git")
            shift
        } || exa_extra_parameter=("")

        if [[  $# == 1 ]]; then
            [[ -d $1 ]] && {
                level="2" 
                directory="$1"
            } || {
                level="${1}"
                directory=""
            }
        fi 


        [[ $# == 2 ]] && directory="${2}"

        exa_default_parameter=("-a" "--color-scale" "--icons" "--color=automatic" "--tree" "--level=${level:-2}" '-I='.git'')
        exa_parameter=(${exa_default_parameter[@]} ${exa_extra_parameter[@]})
        exa  "${exa_parameter[@]}" "${directory:-.}"
    }

    # git set work-tree
    function gswt () {
        [[ "$#" < 2 ]] && echo 'require 2 path parameters' && break 2>/dev/null
        # git --git-dir="${HOME}/gitrepos/.dotrcfiles.git/" --work-tree="${HOME}/gitrepos/awesome-dotfiles"
        git --git-dir="${1}" --work-tree="${2}" config --local status.showUntrackedFiles no
        git --git-dir="${1}" --work-tree="${2}" commit -m 
        # git --git-dir="${1}" --work-tree="${2}" commit -a 
        git --git-dir="${1}" --work-tree="${2}" add -u 
    }

    function setproxy () {
        export https_proxy=http://127.0.0.1:${1:-7890}; \
            http_proxy=http://127.0.0.1:${1:-7890};\
            all_proxy=socks5://127.0.0.1:${1:-7890}
    }

    function cpb()  {
        cp "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mvb()  {
        mv "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mdac() {
        # mkdir "$1" && cd "$1"
        mkdir --parents "$@" && cd "$_" || exit;
    }

    function rmwd() {
        _CDN="$(basename $PWD)";cd "$(dirname $PWD)";rm -rf "$_CDN"
    }

    function mkdf() {
        _Fn="$(basename $1)";_Dn="$(dirname $1)";mkdir -p "$_Dn" && touch "${_Dn}"/"${_Fn}"
    }

    function tca()  {
        tar -czvf "$1.tar.gz" "$1"
    }

    function psr()  {
        ps -ef |rg -S "$1" |rg -vw "rg"
    }

    function gvbc() {
        grep -Ev "^(#|$)" "$1"
    }

    function transfer() {
        curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    }

    # tmux start or resotre sessions
    function tm(){
        TmSID=$(tmux list-sessions |cut -d':' -f1)
        [[ -n $TmSID ]] && tmux attach -t "☯️ " || tmux new -s "☯️ "
    }

    # sad(sed) files(eg. file1 file2)
    function sdf() {
        [[ "${#@}" < 3 ]] && echo 'require 3 args, example: <PATTERN> [REPLACE] files[file1 ...]' && break 2>/dev/null
        /bin/ls -1 "${@:3}" |sad -k "$1" "$2"
    }

    # FZF file and cd to it's directory
    function fcd() {
        [[ -n "$1" ]] && file="$1" || file=$(fd --type file --follow | fzf)

        [[ -n $file ]] && dir=$(dirname "$file" 2>/dev/null) && cd "$dir"
    }

    # tldr with fzf
    function ftl() {
        local initial_query
        initial_query="${*:-}"
        tldr --list |sed -r "s/('|\[|\])//g;s/, /\n/g" |\
            fzf --ansi \
            --info=inline \
            --query "${initial_query}" \
            --preview-window='right:76%:wrap' \
            --preview 'tldr {}'
    }

    function fjtpane() {
        tmux select-window -t $(echo $(tmux list-windows |fzf-tmux -p) |choose 0 -f ':')
    }
    # goto other pane in tmux
    function fjpane() {
        local panes current_window current_pane target target_window target_pane
        panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
        current_pane=$(tmux display-message -p '#I:#P')
        current_window=$(tmux display-message -p '#I')

        target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --tac) || return

        target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
        target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

        if [[ $current_window -eq $target_window ]]; then
            tmux select-pane -t ${target_window}.${target_pane}
        else
            tmux select-pane -t ${target_window}.${target_pane} && tmux select-window -t $target_window
        fi
    }

    # fzf find file that contain KW and nvim edit it
    function fwn() {
        local line rg_cmd initial_query
        rg_cmd="rg --hidden --glob='!.git*' --line-number --no-heading --color=always --column --smart-case "
        initial_query="${*:-}"
        line=$(
        FZF_DEFAULT_COMMAND="$rg_cmd $(printf %q "$initial_query")" \
            fzf --ansi \
            --color "hl:-1:underline,hl+:-1:underline:reverse" \
            --disabled --query "$initial_query" \
            --info=inline \
            --bind "change:reload:sleep 0.1; $rg_cmd {q} || true" \
            --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+clear-query+rebind(ctrl-r)" \
            --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($rg_cmd {q} || true)+rebind(change,ctrl-f)" \
            --prompt '1. Ripgrep> ' \
            --header '[ CTRL-R (Ripgrep mode) | CTRL-F (fzf mode) ]' \
            --delimiter=':' \
            --preview-window='up,60%,border-bottom,+{2}+3/3,~3' \
            --preview 'bat --color=always {1} --highlight-line {2}' \
        ) && nvim "$(cut -d':' -f1 <<<"$line")" +$(cut -d':' -f2 <<<"$line")
    }

    # fzf browser/pick git commit and show file diff
    function fgc() {
        local commits commit logFormat

        curBranch="git branch --show-current"
        logFormat="--pretty=format:'%Cred%h%Creset | %Cblue%cn%Creset | %Cgreen%ai%Creset |%C(yellow)%d%Creset %n%CgreenCommitMsg:%Creset [ %s ]%n'"
        commits="git log --color=always --pretty=format:'%Cred%h%Creset | %Cblue%cn%Creset | %Cgreen%cr%Creset | %s | %d'"
        commit=$(
            bash -c "$commits" |\
            fzf -m -e --ansi \
            --prompt "$(bash -c $curBranch) commits:> " \
            --info=inline \
            --color "hl:underline,hl+:underline" \
            --header "[ CTRL-D (diffview) | CTRL-A (toggle all branches) | CTRL-E (without merges)
                        CTRL-V (change preview) | CTRL-X (toggle preview) | CTRL-R (reload) ]" \
            --bind "ctrl-r:change-prompt($(bash -c $curBranch) commits(current)> )+reload($commits || true)" \
            --bind "ctrl-a:change-prompt($(bash -c $curBranch) commits(all)> )+reload($commits --all || true)" \
            --bind "ctrl-e:change-prompt($(bash -c $curBranch) commits(no-merge)> )+reload($commits --no-merges || true)" \
            --bind "ctrl-d:execute(git show {1} |delta -s >/dev/tty)" \
            --bind "ctrl-v:change-preview-window(down:30%,border-top|hidden|)" \
            --bind "ctrl-x:toggle-preview" \
            --preview-window=up:70%:wrap --preview \
            "git show --name-status --color=always $logFormat {1}"
        )
        [[ -n $commit ]] && echo $(cut -d' ' -f1 <<<"$commit")
    }

    # example usage: git rebase -i `fgc`
    fgc-widget() {
        local result;
        result=$(fgc)
        zle reset-prompt
        LBUFFER+=$result
    }

    # example usage: git diff <C-X><C-X>
    zle -N fgc-widget
    bindkey '^x^x' fgc-widget

    fzf-man-widget() {
    bman="gman {1} | col -bx | bat --language=man --plain --color always --theme=\"Monokai Extended\""
    gman -k . | sort \
    | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue;} 1' \
    | fzf  \
        -q "$1" \
        --ansi \
        --tiebreak=begin \
        --prompt=' Man > '  \
        --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
        --preview "${bman}" \
        --bind "enter:execute(gman {1})" \
        --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
        --bind "alt-m:+change-preview(${bman})+change-prompt( Man > )" \
        --bind "alt-t:+change-preview(tldr {1}))+change-prompt(ﳁ TLDR > )"
      zle reset-prompt
    }
    # `Ctrl-H` keybinding to launch the widget (this widget works only on zsh, don't know how to do it on bash and fish (additionaly pressing`ctrl-backspace` will trigger the widget to be executed too because both share the same keycode)
    zle -N fzf-man-widget
    bindkey '^x^m' fzf-man-widget

    # goto git homepage
    function ggh() {
        # git remote get-url origin |rargs open {}
        remote_ori=$(git status --short --branch|awk -F'[./]+' '/^#.*\.\.\./{print $(NF-1)}')
		ori_url=$(git remote get-url ${remote_ori:-'origin'})
		if [[ -z `echo $ori_url |grep '@'` ]]; then
			open $ori_url
		else
			# new_url=${ori_url/git::@}
            new_url=$(echo ${ori_url} |awk -F'@' '{print $2}' |sed 's#m:#m/#g')
			open https://$new_url
		fi
    }

    function gcfl() {
        local opt="$1"
        local change_commits_count=$(git status |awk 'NR==2{print $(NF-1)}')
        local local_changed=$(git diff HEAD --name-only |wc -l)
        [[ ${opt} == "ori" ]] && local_changed=0
        if [[ ${change_commits_count} =~ [0-9]+ ]] &&  [[ ${local_changed} == 0 ]] then
            git diff HEAD~${change_commits_count} HEAD --name-only
        else
            [[ ${local_changed} == 0 ]] && echo "nothing..."
            git diff HEAD --name-only
        fi
    }

    function fgdf() {
        remote_ori=$1
        local curBranch=$(git branch --show-current)
        local local_changed=$(git diff HEAD --name-only |wc -l)
        local proj_root=$(git rev-parse --show-toplevel)

        if [[ ${remote_ori} == "" ]] && [[ ${local_changed} > 0 ]] then
            branch=${curBranch}
        elif [[ ${remote_ori} == "ori" ]] then
            branch="origin"/"${curBranch}"
        else
            branch=${remote_ori:-origin}"/"${curBranch}
        fi

        gcfl "${remote_ori}" |fzf --ansi --scrollbar=▌▐ --preview-window=up:70%:wrap --preview \
            "batdiff --delta --color --context=1 ${proj_root}/{}"
            # "git diff ${branch:-${curBranch}} -- "${proj_root}/"{} |delta"
    }

    # goto git_root
    function gcr() {
        proj_root=$(git rev-parse --show-toplevel)
        [[ -n ${proj_root} ]] && cd ${proj_root}
    }

    # git clone and cd repo(dirname)
    function gcd() {
        repoUrl=$1
        [[ ${repoUrl: -3} != git ]] && repoUrl="${repoUrl}.git"
        repoName=$(echo ${repoUrl} |awk -F'[/.]+' '{print $(NF-1)}')
        git clone $repoUrl && cd ${repoName}
    }

    # grep for zip archive
    function zipgrep() {
        zipinfo -t -1 -M "$2" |grep "$1"
    }

    # copy file to clipboard
    function cftc() {
        osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'$1'" )'
        echo "The $1 has been copied to the clipboard 😁"
    }

    # Update project dependencies
    function depu() {
        # Git submodules
        if [ -e .gitmodules ]; then
            printf "Updating Git submodules for %s...\n\n" "${PWD##*/}"
            git submodule update --init --remote --rebase --recursive
        fi

        # npm
        if [ -e package-lock.json ]; then
            printf "Updating npm dependencies for %s...\n\n" "${PWD##*/}"
            npm update
            npm outdated
        fi

        # Go
        if [ -e go.mod ]; then
            printf "Updating Go dependencies for %s...\n\n" "${PWD##*/}"
            go get -t -u ./...
            go mod tidy
        fi

        # Rust
        if [ -e Cargo.toml ]; then
            printf "Updating Cargo dependencies for %s...\n\n" "${PWD##*/}"
            cargo update
        fi

        # Python
        if [ -e poetry.lock ]; then
            printf "Updating Python dependencies for %s...\n\n" "${PWD##*/}"
            poetry update
            poetry show --outdated
        fi

        # Terraform
        if [ -e .terraform.lock.hcl ]; then
            printf "Updating Terraform dependencies for %s...\n\n" "${PWD##*/}"
            terraform init -upgrade
        fi
    }
