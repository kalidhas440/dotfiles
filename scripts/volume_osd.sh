#!/bin/bash
VOLUME=$(pamixer --get-volume)

if pamixer --get-mute | grep -q true; then
    notify-send "󰝟 Muted" --expire-time=1000
else
    notify-send -u low " Volume: $VOLUME%" --expire-time=1500
    sleep 1.5 && swaync-client --close-latest
fi

