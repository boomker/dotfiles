## alias config:

## common alias:
    alias -g G=" |egrep -i"
    alias -g R=" |rg -S"
    alias -g H=" |head"
    alias -g T=" |tail"
    alias -g L=" |less"
    alias -g N=" |nl "
    alias -g F=" |fzf --ansi"
    alias -g J=" |jq ."
    alias -g B=" |bat "
    alias -g C=" |cut "
    alias -g X=" |rargs"
    # alias -g X=" |xargs"
    alias -g P=" |parallel"
    alias -g U=" |uniq"
    alias -g S=" |sort"
    alias -g Y=" |tee"
    alias -g W=" |wc -l"
    alias -g CT=" |column -t"
    alias -g AT=" |as-tree"
    alias zft="z_replacement"
    # alias zip="zip -r "
    # alias pps="ptipython3"
    alias ips="ipython3"
    alias idf="icdiff -r -N"
    alias diff="delta "
    # 可以递归对比两目录的差异，包括文件内容的差异
    alias auq="awk '!U[\$0]++' "
    # awk 去重+合并文件内容(相当于两文件的并集，两文件去重后再合并)，而且能保证文件内容顺序
    alias l.="ls -d .* --color=auto"
    alias ls="ls -p --width=80 --color=auto"
    alias ll="ls -rtlh"
    alias wl="wc -l"
    alias sei="sed -i "
    alias sen="sed -n "
    # alias ssh="TERM=xterm-256color ssh"
    alias gcun="git config --global user.name "
    alias gcum="git config --global user.email "
    alias gcl="git clone --filter=blob:none "
    alias gaa="git add ."
    alias gcm="git commit -m "
    alias guc="git commit --amend "
    alias gac="git commit --amend --no-edit"
    alias gis="git status "
    alias gss="git status --short"
    alias gir="git rebase -i "
    alias gbm="git pull origin main --rebase"
    alias gpo="git push origin ||git push -u origin"
    # alias giff="git-icdiff"
    alias gdc="git diff"
    alias gco="git checkout "
    alias gsb="git switch "
    alias gnb="git switch -c "
    alias grep="egrep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias dfh="df -Th"
    alias fdh="fd -H"
    alias fda="fd -H '.*' "
    # alias duhl="du -ah --max-depth=1 "
    # alias trel="tree -L 1 "
    # alias pip3="python3 -m pip"
    # alias piu="python3 -m pip uninstall "
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    # alias pii="python3 -m pip install "
    alias pus="pip3 install --upgrade pip"
    # alias pypi="/usr/local/opt/pypy3/bin/pip"
    alias adl="aria2c -x6 -c "
    alias ffbrowser="/Applications/Firefox.app/Contents/MacOS/firefox"
    alias sshconf="nvim ${HOME}/.ssh/config"
    alias aliconf="nvim ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias alsreload="source ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias zshreload="source ~/.zshrc"
    alias zshconfig="nvim ${HOME}/gitrepos/dotfiles/zsh/.zshrc"
    alias vimconfig="nvim ${HOME}/gitrepos/dotfiles/nvim/.vimrc"
    alias tmuxconfig="nvim ${HOME}/gitrepos/dotfiles/.tmux.conf"

#  alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]] ; then
    alias -g PC=" |pbcopy"
    alias vim="nvim"
    alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias zshconfig="nvim ${HOME}/gitrepos/dotfiles/zsh/.zshrc"
    alias hostsconfg="sudo vim /etc/hosts"
    alias brin="brew install "
    alias brci="brew cask install "
    alias brho="brew home "
    alias echo="gecho"
    alias cp="gcp"
    alias mv="gmv"
    alias mkdir="gmkdir -v "
    # alias man="gman"
    alias ls="exa --color=automatic"
    alias l="exa --git --icons --color=automatic --git-ignore"
    alias ll="exa -abghl --git --icons --color=automatic --git-ignore"
    alias lt="ll --tree --level=2 -I='.git'"
    alias tailf="gtail -f"
    alias nl="gnl"
    alias du="gdu"
    # alias duts="du -ch |tail -1"
    # alias xargs="rargs"
    alias find="gfind"
    alias locate="glocate"
    # alias updatedb="gupdatedb"
    alias grep="grep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    # alias grep="rg"
    alias date="gdate"
    alias cut="gcut"
    alias sed="gsed"
    alias sort="gsort"
    alias stat="gstat"
    alias uniq="guniq"
    alias awk="gawk"
    alias df="gdf"
    alias tr="gtr"
    alias mdsum="gmd5sum"
    alias readlink="greadlink"
    alias lstcp="lsof -nP -iTCP"
    # alias ping="prettyping"
    alias pps="$(which ptipython)"
    alias ips="$(which ipython)"
else
    # alias for *unix
    alias open="xdg-open"
    alias free="free -htw"
    alias pc="xsel --clipboard --input"
    alias pp="xsel --clipboard --output"
    alias mmi="make -j2&&make install"
    alias dstat="dstat -cdlmnpsy"
fi


# common func
    function aama() {
        ansible all -b -m "$1" -a "$2"
    }

    function cpb()  {
        cp "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mvb()  {
        mv "$1" "$1-$(date +%F_%H_%M_%S).bak"
    }

    function mdac() {
        mkdir "$1" && cd "$1"
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
        ps -ef |rg "$1" |rg -vw "rg"
    }


    function gvbc() {
        egrep -v "^(#|$)" "$1"
    }

    tpaf()
    {
        tree -p "$1" |awk '/\[-/{print $NF}'
    }

    transfer() {
        curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    }

    tm(){
        TmSID=$(tmux list-sessions |cut -d':' -f1)
        [[ -n $TmSID ]] && tmux attach -t $TmSID || tmux
    }

    z_replacement()
    {
        [ $# -gt 0 ] && _z "$*" && return
        cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
    }

    # 用来快速跳转到 tmux 其他窗格
    fjpane() {
        local panes current_window current_pane target target_window target_pane
        panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
        current_pane=$(tmux display-message -p '#I:#P')
        current_window=$(tmux display-message -p '#I')

        target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

        target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
        target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

        if [[ $current_window -eq $target_window ]]; then
            tmux select-pane -t ${target_window}.${target_pane}
        else
            tmux select-pane -t ${target_window}.${target_pane} &&
            tmux select-window -t $target_window
        fi
    }

    ffn() {
        fd -H "$1" |fzf --preview-window=right:75%:wrap --preview \
            '(bat --style=numbers --color=always {}) 2> /dev/null | head -100'|xargs nvim -o
    }

    fif() {
        if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
        rg --hidden --glob='!.git' --smart-case --files-with-matches --no-heading --no-column --no-messages "$1" |
            fzf --preview-window=right:75%:wrap --preview \
            "(bat --style=numbers --color=always {}) 2> /dev/null |\
                rg  --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' ||\
                rg  --ignore-case --pretty --context 10 '$1' {}"
    }

    fwn() {
        local line
        line=$(
            rg --hidden --glob='!.git' --no-heading --column --smart-case "$1" | cut -d: -f1,2,3 |
                fzf --preview-window=right:75%:wrap --preview \
                    'bat --terminal-width ${$(($(tput cols) * 0.75 - 2))%.*} --color always \
            "$(echo {}  | cut -d: -f1 )" \
            -H  $(echo {} | cut -d: -f2)  \
            -r  $((\
                    $((\
                        $(echo {} | cut -d: -f2)-8 \
                    ))>0 \
                    ? $((\
                        $(echo {} | cut -d: -f2)-8 \
                    )) \
                    : 0\
                )):$((\
                    $(echo {} | cut -d: -f2)+$(tput lines)/2-1\
                ))'
        ) && nvim "$(cut -d':' -f1 <<<"$line")" +$(cut -d':' -f2 <<<"$line")
    }

    ggh() {
        # git remote get-url origin |rargs open {}
		ori_url=$(git remote get-url origin)
		if [[ -z `echo $ori_url |grep '@'` ]]; then
			open $ori_url
		else
			# new_url=${ori_url/git::@}
            new_url=$(echo ${ori_url} |awk -F'@' '{print $2}' |sed 's#m:#m/#g')
			open https://$new_url
		fi

    }

    gcd() {
        repoUrl=$1
        [[ ${repoUrl: -3} != git ]] && repoUrl="${repoUrl}.git"
        repoName=$(echo ${repoUrl} |awk -F'[/.]+' '{print $(NF-1)}')
        git clone $repoUrl && cd ${repoName}
    }

    fsb() {
        local branches branch
        branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
        branch=$(echo "$branches" |fzf-tmux -r 50%  +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }

    # fcs - get git commit sha
    # example usage: git rebase -i `fcs`
    fcs() {
        local commits commit
        commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
        commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
        echo -n $(echo "$commit" | sed "s/ .*//")
    }

# for macos
    function zipgrep() {
        zipinfo -t -1 -M "$2" |grep "$1"
    }

    # cpoy file to clipboard
    cftc() {
        dirname=$(dirname "$1")
        filename=$(basename "$1")
        cd ${dirname}
        dir=$(pwd)
        osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'${dir}/${filename}'" )'
        cd -
        echo "The $1 has been copied to the clipboard 😁"
        # osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'$1'" )'
    }
