#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')

choice=$(printf '%s\n' \
    "Fullscreen" \
    "Region" |
    rofi -dmenu -theme-str 'listview { lines: 2; }' -i -p "Screenshot")

case "$choice" in
    "Fullscreen")
        sleep 1
	grim "$DIR/hypr_$TIMESTAMP.png"
        ;;
    "Region")
	    grim -g "$(slurp)" "$DIR/hypr_$TIMESTAMP.png"
        ;;
esac
