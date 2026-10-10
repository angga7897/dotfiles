#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')

choice=$(printf '%s\n' \
    "Fullscreen" \
    "Window" \
    "Region" |
    rofi -dmenu -theme-str 'listview { lines: 3; }' -i -p "Screenshot")

case "$choice" in
    "Fullscreen")
        hyprshot -m output -o "$DIR" -f "Screenshot_$TIMESTAMP.png"
        ;;
    "Window")
        hyprshot -m window -o "$DIR" -f "Screenshot_$TIMESTAMP.png"
        ;;
    "Region")
        hyprshot -m region -o "$DIR" -f "Screenshot_$TIMESTAMP.png"
        ;;
esac
