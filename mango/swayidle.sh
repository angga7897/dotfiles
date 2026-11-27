#!/bin/sh

IDLE_TIMEOUT=300

start_idle() {
    if ! pgrep -x swayidle >/dev/null; then
        swayidle -w \
            timeout "$IDLE_TIMEOUT" 'swaylock -f' &
    fi
}

stop_idle() {
    pkill -x swayidle 2>/dev/null
}

while true; do
    STATUS=$(playerctl status 2>/dev/null)

    case "$STATUS" in
        Playing)
            stop_idle
            ;;
        Paused|Stopped|"")
            start_idle
            ;;
    esac

    sleep 2
done
