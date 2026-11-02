#!/usr/bin/env bash

# Opsi pilihan
lock=" Lock"
logout="󰿅 Logout"
suspend="󰒲 Suspend"
reboot="󰜉 Reboot"
shutdown="⏻ Shutdown"

# Tampilkan menu di Rofi
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown"
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:")

# Eksekusi perintah sesuai pilihan
case $chosen in
    $lock)
        i3lock  --indicator \
		--blur 5 \
		--clock \
		--date-color ffffff \
		--time-color ffffff \
        ;;
    $logout)
        i3-msg exit
        ;;
    $suspend)
        systemctl suspend
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
esac
