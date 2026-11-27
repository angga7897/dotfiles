#! /bin/bash

waybar &
sleep 1
killall waybar
sleep 1
waybar 2>&1
