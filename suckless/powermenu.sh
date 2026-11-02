#!/bin/bash

shutdown='⏻ shutdown'
reboot=' reboot'
lock='󰌾 lock'
out='󰿅 log out'

options=$(printf "%s\n" "$lock" "$out" "$reboot" "$shutdown")

chosen=$(echo "$options" | rofi -dmenu -i -p 'Powermenu' -theme-str 'window {lines: 4;}')

case "$chosen" in
    "$lock") i3lock ;;
    "$out") loginctl terminate-user "$USER" ;; # atau: killall dwm / pkill dwm
    "$reboot") systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac
