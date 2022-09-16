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
    alias -g GX=" |xargs"
    alias -g P=" |parallel"
    alias -g U=" |uniq"
    alias -g S=" |sort"
    alias -g Y=" |tee"
    alias -g W=" |wc -l"
    alias -g CT=" |column -t"
    alias -g AT=" |as-tree"
    # alias zft="z_replacement"
    # alias zip="zip -r "
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

    # Git
    alias gaa="git add ."
    alias gcun="git config --global user.name "
    alias gcum="git config --global user.email "
    alias gcm="git commit -m "
    alias gcu="git commit --amend "
    alias gca="git commit --amend --no-edit"

    alias grbi="git rebase -i "
    alias grba='git rebase --abort'
    alias grbc='git rebase --continue'
    alias grbs='git rebase --skip'

    alias gcl="git clone "
    alias gfc="git clone --filter=blob:none "
    alias gfrm="git pull origin main --rebase"

    alias gsms='git submodule sync --recursive'
    alias gsmu='git submodule update --init --recursive'

    alias grmv='git remote --verbose'
    alias grma='git remote add'
    alias grmr='git remote rm'
    alias grmsu='git remote set-url'

    alias gpo="git push ||git push -u origin"
    alias gpf="git push -f"
    alias gpso='git push --set-upstream origin '


    alias glt="git log --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -10"
    alias gla="git log --all --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset' -10"

    alias gdf="git diff "

    alias gco="git checkout "
    alias gsb="git switch "
    alias gnb="git switch -c "
    alias gdb='git branch --delete'

    alias gst="git status "
    alias gws="git status --short"
    alias gwr='git reset --hard'
    alias gwc='git clean -dfx'

    alias gss='git stash'
    alias gsa='git stash apply'
    alias gsd='git stash drop'
    alias gsl='git stash list'

    alias fdh="fd -H"
    alias fda="fd -H '.*' "

    # alias pip3="python3 -m pip"
    # alias piu="python3 -m pip uninstall "
    alias piu="pip3 uninstall "
    alias pii="pip3 install "
    # alias pii="python3 -m pip install "
    alias pus="pip3 install --upgrade pip"
    # alias pypi="/usr/local/opt/pypy3/bin/pip"

    alias adl="aria2c -x6 -c "
    # alias ffb="/Applications/Firefox.app/Contents/MacOS/firefox"
    alias zshconfig="nvim ${HOME}/gitrepos/dotfiles/zsh/.zshrc"
    alias zshreload="source ~/.zshrc"
    alias aliconf="nvim ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias alsreload="source ${HOME}/gitrepos/dotfiles/zsh/.alias.zsh"
    alias tmuxconfig="nvim ${HOME}/gitrepos/dotfiles/.tmux.conf"
    alias sshconf="nvim ${HOME}/.ssh/config"
    # alias vimconfig="nvim ${HOME}/gitrepos/dotfiles/nvim/.vimrc"

#  alias for MacOS_Darwin
if [[ $(uname -s) == "Darwin" ]] ; then
    alias -g PC=" |pbcopy"
    alias e="nvim"
    alias vim="nvim"
    alias o="open"
    alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias hostsconfg="sudo vim /etc/hosts"
    alias brin="brew install "
    alias brci="brew install --cask "
    alias brho="brew home "
    alias ls="exa --color=automatic"
    alias l="exa --git --icons --color=automatic --git-ignore"
    alias ll="exa -abghl --git --icons --color=automatic --git-ignore"
    alias lt="ll --tree --level=2 -I='.git'"

    alias mkdir="gmkdir -pv "
    alias tailf="gtail -f"
    alias grep="egrep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias dfh="gdf -Th"
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


# common func
    # function aama() {
    #     ansible all -b -m "$1" -a "$2"
    # }

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

    transfer() {
        curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    }

    tm(){
        TmSID=$(tmux list-sessions |cut -d':' -f1)
        [[ -n $TmSID ]] && tmux attach -t $TmSID || tmux
    }

    # z_replacement()
    # {
    #     [ $# -gt 0 ] && _z "$*" && return
    #     cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
    # }

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
        branches=$(git for-each-ref --count=30 --sort=-committerdate --format="%(refname:short)") &&
        branch=$(echo "$branches" |fzf-tmux -d 50%  +m) &&
        git switch $(echo "$branch" | sed "s/.* //" | sed -r "s#(origin|remotes)/([^/]*/)?##")
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
        osascript -e 'tell app "Finder" to set the clipboard to ( POSIX file "'$1'" )'
        echo "The $1 has been copied to the clipboard 😁"
    }
