#! /bin/bash

# general
swaybg -i ~/.config/mango/wallpaper.jpg -m fill &
~/.aria2/aria2.sh &
waybar &
dunst &
blueman-applet &
nm-applet &

# brightness
brightnessctl set 10% &
