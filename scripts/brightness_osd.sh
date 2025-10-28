#!/bin/bash
MAX=$(brightnessctl max)
CURRENT=$(brightnessctl get)
PERCENT=$((CURRENT * 100 / MAX))

notify-send -a osd -h string:x-canonical-private-synchronous:osd "󰃠 Brightness: $PERCENT%" #--expire-time=1500 
sleep 1.5 && swaync-client --close-latest  
