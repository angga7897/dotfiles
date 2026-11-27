#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')


case "$1" in
    "fullscreen")
        sleep 1
	grim "$DIR/mango_$TIMESTAMP.png"
        ;;
    "region")
	    grim -g "$(slurp)" "$DIR/mango_$TIMESTAMP.png"
        ;;
esac
