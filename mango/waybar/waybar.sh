#! /bin/bash

killall waybar
waybar -c ~/.config/mango/waybar/bottom-bar.jsonc -s ~/.config/mango/waybar/bottom-bar.css &
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css &
