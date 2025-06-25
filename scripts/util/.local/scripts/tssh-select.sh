#!/usr/bin/env bash

hosts_file="$HOME/.config/tmux/ssh-hosts.sh"

if [ ! -f "$hosts_file" ]; then
	tmux display-message -d 3000 "ssh hosts file not found"
	sleep 3
	exit 1
fi

source $hosts_file >/dev/null 2>&1

selected=$(cat "$hosts_file" | grep -v '&#' | fzf --height=40% --prompt="Type or select SSH host: ")

if [[ -z $selected ]]; then
	echo "No host selected. Exiting."
	exit 0
fi

ssh_name=$(echo "$selected")

selected_name="SSH-${ssh_name}"

if ! tmux has-session -t=$selected_name 2>/dev/null; then
	tmux new-session -s "$selected_name" -d "ssh $ssh_name"
fi

tmux switch-client -t "$selected_name"
