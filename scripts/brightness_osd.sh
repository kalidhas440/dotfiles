#!/bin/bash
MAX=$(brightnessctl max)
CURRENT=$(brightnessctl get)
PERCENT=$((CURRENT * 100 / MAX))

echo "󰃠 $PERCENT%" | osd_cat -p middle -A center  -d 1 -o 5
