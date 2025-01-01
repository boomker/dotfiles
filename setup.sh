#!/bin/bash

[[ -n $(lsof -nP -i :7890 -i :1080) ]] && echo 'proxy ok' || {
	echo 'proxy fail' && exit
}

[[ -n $(lsof -nP -i :7890) ]] && {
	export https_proxy=http://127.0.0.1:7890
	export http_proxy=http://127.0.0.1:7890
	export all_proxy=socks5://127.0.0.1:7890
}

[[ -n $(lsof -nP -i :1087) ]] && {
	export http_proxy=http://127.0.0.1:1087
	export https_proxy=http://127.0.0.1:1087
	export ALL_PROXY=socks5://127.0.0.1:1080
}

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -sSL https://raw.githubusercontent.com/boomker/dotfiles/refs/heads/main/Brewfile
[[ -e ./Brewfile ]] && brew bundle --file=./Brewfile

mkidr -p "${HOME}/.zprezto/contrib/user_plugins" "${HOME}/.tmux/plugins"

export PREZCUSMODIR="${HOME}/.zprezto/contrib"

git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone git@github.com:Aloxaf/fzf-tab.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/fzf-tab"
git clone git@github.com:romkatv/zsh-defer.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-defer"
git clone git@github.com:marzocchi/zsh-notify.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-notify"
git clone git@github.com:Skylor-Tang/auto-venv.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/auto-venv"
git clone git@github.com:hlissner/zsh-autopair.git "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-autopair"

git clone git@github.com:boomker/uvcode.git "${HOME}/gitrepos/uvcode"
git clone git@github.com:boomker/dotfiles.git "${HOME}/gitrepos/dotfiles"
git clone git@github.com:boomker/spacehammer.git "${HOME}/gitrepos/spacehammer"

if [[ -d "${HOME}/gitrepos/dotfiles" ]]; then
	ln -sv "${HOME}/gitrepos/dotfiles/zsh/.*" "${HOME}/"
	ln -sv "${HOME}/gitrepos/dotfiles/.config/*" "${HOME}/.config/"
	ln -sv "${HOME}/gitrepos/dotfiles/git/.gitconfig" "${HOME}/"
	ln -sv "${HOME}/gitrepos/dotfiles/tmux/.tmux.conf" "${HOME}/"
	ln -sv "${HOME}/gitrepos/dotfiles/tmux/fzf-tmux-pane" "${HOME}/.tmux/plugins/"
	cp -aR "${HOME}/gitrepos/dotfiles/zsh/*.zsh" "${PREZCUSMODIR:-$HOME/.zprezto/contrib}/user_plugins/"
fi

[[ -d "${HOME}/gitrepos/spacehammer" ]] && ln -sv "${HOME}/gitrepos/spacehammer" "${HOME}/.config/"

[[ -d "${HOME}/gitrepos/uvcode" ]] && ln -sv "${HOME}/gitrepos/uvcode" "${HOME}/.config/"

[[ -e $(which neovim) ]] && ln -sv /usr/local/opt/nvim/share/nvim "${HOME}/.nvim"

[[ -e $(which yazi) ]] && ya pack -i && ya pack -u

sed -i '' \
	-e '5s/==/=~/' \
	-e '5s%Apple_Terminal%tmux|ghostty|WezTerm|iTerm|Apple_Terminal%' \
	"${PREZCUSMODIR:-$HOME/.zprezto/contrib}/zsh-notify/notify.plugin.zsh"

ssh-keygen -t ed25519 -q -P ''
