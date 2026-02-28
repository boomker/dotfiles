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
alias -g BL="  bat --plain --language=log"
alias -g BH="  bat --plain --language=help"
alias -g BB="  bat --plain --language=bash"
alias -g BJ="  bat --plain --language=json"
alias -g C="   hck "
alias -g D="   delta -s"
alias -g RX="  rargs"
alias -g X="   xargs"
alias -g P="   peco"
alias -g PC="  pbcopy"
alias -g RP="  rust-parallel"
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

alias -g C1=" hck -f 1"
alias -g C2=" hck -f 2"
alias -g C3=" hck -f 3"
alias -g C4=" hck -f 4"
alias -g C5=" hck -f 5"
alias -g C6=" hck -f 6"
alias -g C7=" hck -f 7"
alias -g C8=" hck -f 8"
alias -g C9=" hck -f 9"

alias adl="aria2c -x6 -c "
alias auq="awk '!U[\$0]++' "
alias cprp="cp -rp --parents "
alias ll="ls -rtlh"
alias l.="ls -d .* --color=auto"
alias ls="ls -p --width=80 --color=auto"
alias bdf="batdiff --color --delta --context=1 "
alias wl="wc -l"
alias diff="delta "
alias sei="sed -i "
alias sen="sed -n "
alias sre='sudo $(fc -ln -1)' # switch root exec
# alias xssh="TERM=xterm-256color ssh"

# Linux help tools:
alias nqh='navi --query '

# network
alias lstcp="lsof -nP -iTCP"
alias dog="dig +noall +nocmd +answer "

# markdown
alias gpm="glow -p "

# imgcat
# alias kic="kaku imgcat "

# Git --------------------------

alias lg="lazygit"
alias gaa="git add ."
alias gcm="git commit -m "
alias gca="git commit --amend "
alias gce="git commit --allow-empty"
alias gcun="git config --global user.name "
alias gcum="git config --global user.email "

alias gcpm='git cherry-pick -x -m 1 '
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcps="git cherry-pick --skip"

alias grbi="git rebase -i "
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias gcl="git clone "
alias gib="git init --bare "
alias gcb="git clone --bare "
alias gcbn="git clone --filter=blob:none "

alias gprm="git pull origin main --rebase"
alias gpom="git pull origin main || git pull origin master"
alias gpum="git pull upstream main || git pull upstream master"

alias gprf="git push -f"
alias gpsu='git push --set-upstream '
alias gpor="git push ||git push -u origin"

alias gsms='git submodule sync --recursive'
alias gsmu='git submodule update --init --recursive'

alias grma='git remote add'
alias grmr='git remote rm'
alias grms='git remote set-url'
alias grmv='git remote --verbose'

alias gco="git checkout "
alias gsb="git switch "
alias gbs="git switch "
alias gbn="git switch -c "
alias gbv="git branch -v "
alias gbd='git branch --delete'

alias gss="scmpuff_status"
alias gst="git status "
alias gws="git status --short"
alias gwr='git reset --hard'
alias gwc='git clean -df'

alias gdf="git diff "
alias grt="git restore "
alias grs="git restore --stage"

alias gsh='git stash'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gsl='git stash list'

alias gcig="git check-ignore -v"
alias guiu='git update-index --assume-unchanged '

# example: glp -n, glp 7f1b6b0..8724539
alias glp="git log --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' "
alias glt="git log --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -10"
alias gla="git log --all --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -20"

# alias gltf='git ls-tree -r --name-only '
# alias glui="git ls-files -o -i --exclude-standard"
# ------ git aliases end ---------

# fd
alias fdg="fd --exclude='.git' --no-ignore "
alias fdp="fd -tf -p -g "

# rg
alias rg="rg  --smart-case --glob='!.git*' "
alias rgg="rg -. --glob='!.git*' "

## python tools:
alias ips="ipython3"

# uv
alias upin="uv pip install "
alias upui="uv pip uninstall "
alias uvpt="uv venv --prompt "
alias upur="uv pip install -Ur requirements.txt"

# nvim
alias e="nvim"
alias vim="nvim"
alias nvdf="nvim -d"
alias nves="nvim -es"
alias nvcl="nvim --clean"

# zsh, tmux, ssh, hosts conf
alias zshreload="source ~/.zshrc"
alias hostsconf="sudo vim /etc/hosts"
alias sshconf="nvim ${HOME}/.ssh/config"
alias zshconf="nvim ${HOME}/gitrepos/dotfiles/zsh/.zshrc"
alias aliconf="nvim ${HOME}/gitrepos/dotfiles/zsh/.aliases.zsh"
alias tmuxconf="nvim ${HOME}/gitrepos/dotfiles/tmux/.tmux.conf"

# undo proxy
alias unsetproxy="
	unset http_proxy;
	unset https_proxy;
	unset all_proxy;
	unset HTTP_PROXY;
	unset HTTPS_PROXY;
	unset ALL_PROXY;
    git config --global --unset https.proxy
	echo 'Unset proxy successfully'"

#  alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]]; then
    alias o="open"
    alias plp="plutil -p "
    alias brho="brew home "
    alias brif="brew info "
    alias brin="brew install "
    alias brci="brew install --cask "
    alias brcl="brew cleanup --prune=all"

    alias lsflags="/bin/ls -lO "
    # alias ls="eza --color=automatic"
    alias la="eza -a --color=automatic"
    alias l="eza --git --icons --color=automatic"
    alias ll="eza -lh --git --icons --color=automatic --group-directories-first"
    alias rm="trash"
    alias rmls="trash-list"
    alias rmrs="trash-restore"
    alias rmcl="trash-empty"
    alias mdir="gmkdir -pv "
    alias tailf="gtail -f -n "
    alias dfh="/opt/homebrew/bin/gdf -Th"
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
    "$@" --help 2>&1 | bat --plain --language=help
}

# zsh, zprezto update
function zpupdate() {
    zprezto-update
    git -C ${ZPREZTODIR} pull || break 2>/dev/null
    git -C ${ZPREZTODIR} submodule sync --recursive
    git -C ${ZPREZTODIR} submodule update --init --recursive
    for i in $(/bin/ls -1d ${PREZCUSMODIR}/*); do
        echo -e "${i}: \n"
        git -C $i pull --rebase
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
function fbug() {
    local initial_query token
    local -a pickers
    initial_query="${*:-}"
    token=$( (
        brew outdated
        mas outdated
    ) | fzf-tmux \
        -1 -m -e --cycle \
        --query="$initial_query" \
        --preview 'brew info {1} || mas info {1}')
    pickers=($(echo "${token}" | gsed 's/ .*//;s/\n/ /'))
    if [ "x$pickers" != "x" ]; then
        for p in "${pickers[@]}"; do
            [[ "$p" =~ "^[0-9]+$" ]] && mas upgrade $p || {
                brew upgrade --force --overwrite $p || brew upgrade --cask $p
            }
        done
    fi
}

# fzf with tssh to login
function ftsh() {
    local initial_query token
    local -a pickers
    initial_query="${*:-}"
    token=$(
        awk 'NR==FNR&&$1~/^Host/{print $2};{if(NR!=FNR&&$1~/[0-9.]+/){print $1}}' ~/.ssh/config ~/.ssh/known_hosts |
            rg -v 'localhost|:' | sort -u |
            fzf-tmux \
                --query="$initial_query" \
                -w60% -h60% -m -e -0 -1 --cycle --border --ansi
    )
    pickers=($(echo "${token}" | tr "\n" " "))
    if [ "x$token" != "x" ] && [[ "${#pickers}" == 1 ]]; then
        if [[ "${token}" =~ ^[0-9.]+ ]]; then
            tssh root@"${token}"
        else
            tssh "${token}"
        fi
    else
        for i in "${pickers[@]}"; do
            [[ "${i}" =~ ^[0-9.]+ ]] && tmux new-window "tssh root@$i" || tmux new-window -n "$i" "tssh $i"
        done
    fi
}

# eza(ls) with `tree` of option
function lt() {
    [[ "${1}" == -l ]] && {
        eza_extra_parameter=("-bghlF" "--group-directories-first" "--git")
        shift
    } || eza_extra_parameter=("")

    if [[ $# == 1 ]]; then
        [[ -d $1 ]] && {
            level="2"
            directory="$1"
        } || {
            level="${1}"
            directory=""
        }
    fi

    [[ $# == 2 ]] && directory="${2}"

    eza_default_parameter=("-a" "--color-scale" "--icons" "--color=automatic" "--tree" "--level=${level:-2}" '-I='.git'')
    eza_parameter=(${eza_default_parameter[@]} ${eza_extra_parameter[@]})
    eza "${eza_parameter[@]}" "${directory:-.}"
}

function setproxy() {
    export https_proxy=http://${1:-127.0.0.1}:${2:-7890}
    export http_proxy=http://${1:-127.0.0.1}:${2:-7890}
    export all_proxy=socks5://${1:-127.0.0.1}:${2:-7890}
    export HTTPS_PROXY=http://${1:-127.0.0.1}:${2:-7890}
    export HTTP_PROXY=http://${1:-127.0.0.1}:${2:-7890}
    export ALL_PROXY=socks5://${1:-127.0.0.1}:${2:-7890}
    if [[ -f ~/.gitconfig ]]; then
        # sed -i -r "/$1/s/(\;|#) //" ~/.gitconfig
        rg '$1' ~/.gitconfig
    else
        git config --global https.proxy socks5://${1:-127.0.0.1}:${2:-7890}
    fi
}

function cpb() {
    cp "$1" "$1-$(date +%F_%H_%M_%S).bak"
}

function mvb() {
    mv "$1" "$1-$(date +%F_%H_%M_%S).bak"
}

function mdac() {
    mkdir --parents "$@" && cd "$_" || exit
}

function mkdf() {
    _Fn="$(basename $1)"
    _Dn="$(dirname $1)"
    mkdir -p "$_Dn" && touch "${_Dn}"/"${_Fn}"
}

function rmwd() {
    _CDN="$(basename $PWD)"
    cd "$(dirname $PWD)"
    rm -rf "$_CDN"
}

# grep for zip archive
function zipr() {
    zipinfo -t -1 -M "$2" | rg "$1"
}

function tca() {
    tar -czvf "$1.tar.gz" "$1"
}

function psr() {
    ps -ef | rg -S "$1" | rg -vw "rg"
}

function gvbc() {
    grep -Ev "^(#|$)" "$1"
}

function transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null
}

function yz() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function cftp() {
    osascript -e "tell application 'Finder' to set the clipboard to (POSIX file '$1')"
}

# FZF file and cd to it's directory
function fcd() {
    [[ -n "$1" ]] && file="$1" || file=$(fd --type file | fzf)

    [[ -n $file ]] && dir=$(dirname "$file" 2>/dev/null) && cd "$dir"
}

# goto other pane in tmux
function fjtp() {
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
            --preview 'bat --color=always {1} --highlight-line {2}'
    ) && nvim "$(cut -d':' -f1 <<<"$line")" +$(cut -d':' -f2 <<<"$line")
}

# fzf browser/pick git commit and show file diff
function fgc() {
    local commits commit logFmt

    curBranch="git branch --show-current"
    logFmt="--pretty=format:'%Cred%h%Creset | %Cblue%cn%Creset | %Cgreen%ai%Creset |%C(yellow)%d%Creset %n%CgreenCommitMsg:%Creset [ %s ]%n'"
    commits="git log --color=always --pretty=format:'%Cred%h%Creset | %Cblue%cn%Creset | %Cgreen%cr%Creset | %s | %d'"
    header="[ CTRL-D (diffview) | CTRL-A (toggle all branches) | CTRL-E (without merges) |
              CTRL-R (reload)   | CTRL-V (change preview)      | CTRL-X (toggle preview) ]"
    commit=$(
        bash -c "$commits" |
            fzf -m -e --ansi \
                --prompt "$(bash -c $curBranch) commits:> " \
                --info=inline \
                --header ${header//    / } \
                --color "hl:underline,hl+:underline" \
                --bind "ctrl-x:toggle-preview" \
                --bind "ctrl-d:execute(git show {1} |delta -s >/dev/tty)" \
                --bind "ctrl-v:change-preview-window(down:30%,border-top|hidden|)" \
                --bind "ctrl-r:change-prompt($(bash -c $curBranch) commits(current)> )+reload($commits || true)" \
                --bind "ctrl-a:change-prompt($(bash -c $curBranch) commits(all)> )+reload($commits --all || true)" \
                --bind "ctrl-e:change-prompt($(bash -c $curBranch) commits(no-merge)> )+reload($commits --no-merges || true)" \
                --preview-window=up:70%:wrap --preview \
                "git show --name-status --color=always $logFmt {1}"
    )
    [[ -n $commit ]] && echo $(cut -d' ' -f1 <<<"$commit")
}

# tldr with fzf
function ftl() {
    local initial_query
    initial_query="${*:-}"
    tldr --list | sed -r "s/('|\[|\])//g;s/, /\n/g" |
        fzf -0 -1 -e --cycle \
            --info=inline \
            --query "${initial_query}" \
            --preview-window='down:80%:wrap' \
            --preview 'tldr --color=always {}'
}

function gcfl() {
    local opt="$1"
    local change_commits_count=$(git status | awk 'NR==2{print $(NF-1)}')
    local local_changed=$(git diff HEAD --name-only | wc -l)
    if [[ ${opt} == "local" ]]; then
        [[ ${local_changed} == 0 ]] && echo "nothing..."
        git status --short | gawk '/M/{print $2}'
    elif [[ ${change_commits_count} =~ [0-9]+ ]]; then
        git diff HEAD~${change_commits_count} HEAD --name-only
    else
        [[ ${local_changed} == 0 ]] && echo "nothing..."
        git status --short | gawk '{print $2}'
        # git status --short |gawk '/M/{print $2}'
    fi
}

# view git diff
function fgdf() {
    remote_ori=$1
    local curBranch=$(git branch --show-current)
    local local_changed=$(git diff HEAD --name-only | wc -l)
    local change_commits_count=$(git status | awk 'NR==2{print $(NF-1)}')
    local proj_root=$(git rev-parse --show-toplevel)

    if [[ ${remote_ori} == "" ]] && [[ ${local_changed} > 0 ]] && [[ ${change_commits_count} =~ [a-z]+ ]]; then
        branch=${curBranch}
    elif [[ ${remote_ori} == "local" ]]; then
        branch="origin"/"${curBranch}"
    else
        branch=${remote_ori:-origin}"/"${curBranch}"~${change_commits_count}"
    fi

    gcfl "${remote_ori}" | fzf --scrollbar=▌ --preview-window=up:70%:wrap --preview \
        "[[ "x${remote_ori}" == 'x' ]] && git diff ${branch:-${curBranch}} -- ${proj_root}/{} |delta || batdiff --delta --color --context=1 {}"
}

# goto git repo homepage
function goph() {
    # git remote get-url origin |rargs open {}
    remote_ori=$(git status --short --branch | awk -F'[./]+' '/^#.*\.\.\./{print $(NF-1)}')
    ori_url=$(git remote get-url ${remote_ori:-'origin'})
    if [[ -z $(echo $ori_url | grep '@') ]]; then
        open $ori_url
        [[ $? != 0 ]] && open -a "Google Chrome" $ori_url
    else
        # new_url=${ori_url/git::@}
        new_url=$(echo ${ori_url} | awk -F'@' '{print $2}' | sed 's#m:#m/#g')
        open https://$new_url
        [[ $? != 0 ]] && open -a "Google Chrome" https://$new_url
    fi
}

# goto git project root
function gcpr() {
    proj_root=$(git rev-parse --show-toplevel)
    [[ -n ${proj_root} ]] && cd ${proj_root}
}

# git clone and cd proj_root
function gcpd() {
    repoUrl=$1
    [[ ${repoUrl: -3} != git ]] && repoUrl="${repoUrl}.git"
    repoName=$(echo ${repoUrl} | awk -F'[/.]+' '{print $(NF-1)}')
    git clone $repoUrl && cd ${repoName}
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
        # go get -t -u ./...
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
