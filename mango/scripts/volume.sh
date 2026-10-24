#!/bin/bash

NOTIFY_ID=9993
STEP=5

case "$1" in
    up)
	pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
	pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)


if [ "$MUTED" = "true" ]; then
    TITLE="MUTED"
else
    TITLE="Volume: $VOLUME%"
fi

dunstify \
    -r "$NOTIFY_ID" \
    -a "Volume" \
    -u low \
    -h int:value:"$VOLUME" \
    "$TITLE" \
