#!/bin/bash
VOLUME=$(pamixer --get-volume)

if pamixer --get-mute | grep -q true; then
    notify-send -a osd"󰝟 Muted" --expire-time=1000
else
    notify-send -a osd " Volume: $VOLUME%" --expire-time=1500
    sleep 1.5 && swaync-client --close-latest
fi

