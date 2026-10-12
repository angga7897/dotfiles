#!/bin/sh

dunst &
picom &
nm-applet &
blueman-applet &
xrdb -merge ~/.Xresources &
setroot -cursor_name left_ptr &
xset s off -dpms &
