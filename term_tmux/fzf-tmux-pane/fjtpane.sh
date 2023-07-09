#!/usr/bin/env bash
#===============================================================================
#   Author: Boomker
#    Email: gmboomker@gmail.com
#  Created: 2023-07-03 12:12
#===============================================================================
get_fzf_options() {
    local fzf_options
    local fzf_default_options='-w75% -h75% -m -e -0 --border --ansi --preview-window=up:70%:wrap --preview "tmux capture-pane -pJS -20 -t {1}"'
    # fzf_options="$(tmux show -gqv '@fzf-tmux-pane-jump-option')"
    [ -n "$fzf_options" ] && echo "$fzf_options" || echo "$fzf_default_options"
}

fzf_filter() {
  eval "fzf-tmux $(get_fzf_options)"
}

select_window() {
    tmux select-pane -t "$@" && tmux select-window -t "${@%%.*}"
}
items=$(tmux list-panes -s -F '#I.#P - #W - #T #{pane_current_path} #{pane_current_command}' |column -t)

fzf_filter <<< "$items"  |awk '{print $1}'| \
    while read -r chosen; do
        select_window "$chosen" &>"/tmp/tmux-$(id -u)-sel_pane.log"
    done
