if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx PATH /usr/local/bin/ ~/.local/bin/ ~/.cargo/bin/ $PATH
    zoxide init fish | source
    source ~/.zprezto/contrib/user_plugins/fzf.fish
    source (/usr/local/bin/starship init fish --print-full-init | psub)
end
