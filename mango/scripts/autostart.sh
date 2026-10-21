#! /bin/bash

# general
swaybg -i ~/.config/mango/wallpaper.jpg -m fill &
waybar &
dunst &
systemctl --user start obex

# brightness
brightnessctl set 80% &
