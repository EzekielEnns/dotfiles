#!/usr/bin/bash

#TODO add work folder to match .git locations
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Documents/School ~/Documents/Work/ ~/Documents/  -mindepth 1 -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ $TERM_PROGRAM -eq "tmux" ]]; then
    tmux new -A -s "$selected_name" -c "$selected" -d "nvim \"$selected\""
    tmux switch -t "$selected_name"
else 
    tmux new -A -s "$selected_name" -c "$selected" \; new-window nvim "$selected"
fi
