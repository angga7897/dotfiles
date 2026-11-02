#! /bin/bash

nm-applet &
dunst &
~/.config/suckless/status.sh &
picom &
~/.fehbg
xrdb -merge ~/.Xresources &
setroot -cursor_name left_ptr &
xset s off -dpms &

exec dbus-run-session dwm
