#!/bin/bash

NOTIFY_ID=9993
STEP=5

case "$1" in
    up)
        pamixer -i "$STEP"
	pamixer -u
        ;;
    down)
        pamixer -d "$STEP"
	pamixer -u
        ;;
    mute)
        pamixer -t
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
