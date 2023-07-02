#!/usr/bin/env bash
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-04-06 12:12
#===============================================================================
get_fzf_options() {
    local fzf_options
    local fzf_default_options='-d 35% -m -0 --no-preview --no-border'
    fzf_options="$(tmux show -gqv '@fzf-url-fzf-options')"
    [ -n "$fzf_options" ] && echo "$fzf_options" || echo "$fzf_default_options"
}

fzf_filter() {
  eval "fzf-tmux $(get_fzf_options)"
}

select_window() {
    tmux select-pane -t "$@" && tmux select-window -t "${@%%.*}"
}

# items=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
items=$(tmux list-panes -s -F '#I:#P - #W |#{pane_current_path} |#{pane_current_command}' |column -t)

fzf_filter <<< "$items"  |awk -F'[ :]+' '{print $1"."$2}'| \
    while read -r chosen; do
        select_window "$chosen" &>"/tmp/tmux-$(id -u)-sel_pane.log"
    done
