[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source "${HOME}/gitrepos/dotfiles/bash/starship_prompt.bash"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/cyzhu/.lmstudio/bin"

# carapace
export CARAPACE_BRIDGES='bash,inshellisense' # optional
[[ -e $(which carapace) ]] && source <(carapace _carapace)
