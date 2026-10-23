#!/bin/sh
swaymsg -t subscribe -m '["workspace"]' | while read -r _; do
    swaymsg -t get_workspaces | jq -r 'map(select(.num > 0)) | sort_by(.num) | to_entries[] | select(.value.num != .key + 1) | "rename workspace \(.value.name) to \(.key + 1)"' | while read -r cmd; do
        swaymsg "$cmd"
    done
done
