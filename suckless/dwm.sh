#! /bin/bash

nm-applet &
dunst &
~/.config/suckless/status.sh &
picom &
xwallpaper --stretch ~/.config/suckless/wallpaper.jpg &
xrdb -merge ~/.Xresources &
setroot -cursor_name left_ptr &
xset s off -dpms &

exec dbus-run-session dwm
