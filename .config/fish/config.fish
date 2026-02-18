if status is-interactive
    set -gx PATH /opt/homebrew/bin/ ~/.local/bin/ ~/.cargo/bin/ /usr/local/bin/ $PATH
    source ~/.zprezto/contrib/user_plugins/tv.fish
    # source ~/.zprezto/contrib/user_plugins/fzf.fish
    source ~/.zprezto/contrib/user_plugins/zoxide.fish
    source ~/.zprezto/contrib/user_plugins/scmpuff.fish
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

    # alias
    alias gss scmpuff_status

end
