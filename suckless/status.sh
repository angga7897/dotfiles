#!/bin/sh

while true; do

    CLOCK=$(date '+%A, %d %b %Y | %H:%M')
    VOL=$(pamixer --get-volume-human)
    BRIGHT=$(brightnessctl -m | cut -d',' -f4)
    # Update Status Bar
    xsetroot -name "|  $BRIGHT | 󰓃 $VOL |  $CLOCK |"

    sleep 1
done
