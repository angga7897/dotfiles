#! /bin/bash

ID=9920

case "$1" in
up)
  brightnessctl set 5%+
  ;;
down)
  brightnessctl set 5%-
  ;;
*)
  echo "Usage: $0 {up|down}"
  exit 1
  ;;
esac

CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)
BRIGHTNESS=$((CURRENT * 100 / MAX))

ICON=""

dunstify \
  -r "$ID" \
  -u low \
  -h "int:value:$BRIGHTNESS" \
  "$ICON $BRIGHTNESS%"
