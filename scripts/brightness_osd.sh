#!/bin/bash
MAX=$(brightnessctl max)
CURRENT=$(brightnessctl get)
PERCENT=$((CURRENT * 100 / MAX))

notify-send -u low "󰃠 Brightness: $PERCENT%" --expire-time=1500
sleep 1.5 && swaync-client --close-latest 
