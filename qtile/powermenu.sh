#!/bin/bash

# Daftar Opsi Menu
shutdown="⏻ Shutdown"
reboot="⟳ Reboot"
logout="󰍃 Logout"

# Tampilkan menu rofi dan simpan pilihan ke variabel
chosen=$(echo -e "$shutdown\n$reboot\n$logout" | rofi -dmenu -theme-str 'listview { lines: 3; }' -i -p "Power Menu:")

# Eksekusi perintah berdasarkan pilihan
case "$chosen" in
    "$shutdown")
        poweroff
        ;;
    "$reboot")
        reboot
        ;;
    "$logout")
        qtile cmd-obj -o cmd -f shutdown
        ;;
esac
