#! /bin/bash

pkill -x waybar
sleep 1
waybar 2>&1
