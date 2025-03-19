#!/bin/bash
MAX=$(brightnessctl max)
CURRENT=$(brightnessctl get)
PERCENT=$((CURRENT * 100 / MAX))

notify-send "󰃠 Brightness: $PERCENT%" --expire-time=1000

