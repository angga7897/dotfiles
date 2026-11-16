#! /bin/bash

# general
swaybg -i ~/.config/mango/wallpaper.jpg -m fill &
waybar &
dunst &
#"/home/angga/.local/ABDownloadManager/bin/ABDownloadManager" --background &
"/usr/bin/misterdownloadmanager" /startup &

# brightness
brightnessctl set 80% &
