if status is-interactive
    set -gx PATH /opt/homebrew/bin/ ~/.local/bin/ ~/.cargo/bin/ /usr/local/bin/ $PATH
    zoxide init fish | source
    source ~/.zprezto/contrib/user_plugins/fzf.fish
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end
