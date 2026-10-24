#! /bin/bash

# general
swaybg -i ~/.config/mango/wallpaper.jpg -m fill &
waybar &
dunst &

# brightness
brightnessctl set 80% &
