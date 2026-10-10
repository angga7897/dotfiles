#! /bin/bash

pkill -x waybar
sleep 1
pgrep -x waybar >/dev/null || waybar -c ~/.config/hypr/waybar/config.jsonc -s ~/.config/hypr/waybar/style.css &
