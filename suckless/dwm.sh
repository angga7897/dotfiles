#! /bin/bash

nm-applet &
blueman-applet &
dunst &
~/.config/suckless/status.sh &
picom &
~/.fehbg
xrdb -merge ~/.Xresources &
setroot -cursor_name left_ptr &
xset s off -dpms &
dbus-update-activation-environment --all &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &


#exec dbus-run-session dwm
exec dwm
