#!/bin/bash

[[ -n $(lsof -nP -i :7890 -i :1080) ]] && echo 'proxy ok' || {
    echo 'proxy fail' && exit
}

[[ -n $(lsof -nP -i :1087) ]] && {
    export http_proxy=http://127.0.0.1:1087
    export https_proxy=http://127.0.0.1:1087
    export ALL_PROXY=socks5://127.0.0.1:1080
}

curl -fsSL https://zerobrew.rs/install | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -sSL https://raw.githubusercontent.com/boomker/dotfiles/packages/refs/heads/main/Brewfile
curl -sSL https://raw.githubusercontent.com/boomker/dotfiles/packages/refs/heads/main/zbrewfile
[[ -e ./Brewfile ]] && brew bundle --file=./Brewfile
[[ -e ./zbrewfile ]] && zb bundle install -f ./zbrewfile

mkidr -p "${HOME}/.zprezto/contrib/user_plugins" "${HOME}/.tmux/plugins"

export PREZCUSMODIR="${HOME}/.zprezto/contrib"

git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone git@github.com:Aloxaf/fzf-tab.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/fzf-tab"
git clone git@github.com:romkatv/zsh-defer.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-defer"
git clone git@github.com:Skylor-Tang/auto-venv.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/auto-venv"
git clone git@github.com:hlissner/zsh-autopair.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-autopair"
git clone git@github.com:alberti42/zsh-opencode-tab.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-opencode-tab"

git clone git@github.com:boomker/uvcode.git "${HOME}/gitrepos/uvcode"
git clone git@github.com:boomker/dotfiles.git "${HOME}/gitrepos/dotfiles"
git clone git@github.com:boomker/spacehammer.git "${HOME}/gitrepos/spacehammer"

if [[ -d "${HOME}/gitrepos/dotfiles" ]]; then
    ln -fsv "${HOME}/gitrepos/dotfiles/zsh/.*" "${HOME}/"
    ln -fsv "${HOME}/gitrepos/dotfiles/.ssh/config" "${HOME}/"
    ln -fsv "${HOME}/gitrepos/dotfiles/git/.gitconfig" "${HOME}/"
    ln -fsv "${HOME}/gitrepos/dotfiles/.config/*" "${HOME}/.config/"
    ln -fsv "${HOME}/gitrepos/dotfiles/tmux/.tmux.conf" "${HOME}/"
    ln -fsv "${HOME}/gitrepos/dotfiles/tmux/fzf-tmux-pane" "${HOME}/.tmux/plugins/"
    ln -svf "${HOME}~/gitrepos/dotfiles/zsh/completions" "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/"
    ln -fsv "${HOME}/gitrepos/dotfiles/zsh/*.zsh" "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/user_plugins/"
fi

[[ -d "${HOME}/gitrepos/spacehammer" ]] && ln -sv "${HOME}/gitrepos/spacehammer" "${HOME}/.config/"

[[ -d "${HOME}/gitrepos/uvcode" ]] && ln -sv "${HOME}/gitrepos/uvcode" "${HOME}/.config/"

[[ -e $(which neovim) ]] && ln -sv /usr/local/opt/nvim/share/nvim "${HOME}/.nvim"

[[ -e $(which yazi) ]] && ya pack -i && ya pack -u

ssh-keygen -t ed25519 -q -P ''
