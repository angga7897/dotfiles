#!/bin/bash

if ! pgrep -x pipewire >/dev/null; then
  pipewire &
fi

if ! pgrep -x wireplumber >/dev/null; then
  wireplumber &
fi

if ! pgrep -x pipewire-pulse >/dev/null; then
  pipewire-pulse &
fi
