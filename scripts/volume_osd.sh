#!/bin/bash
VOLUME=$(pamixer --get-volume)

if pamixer --get-mute | grep -q true; then
    notify-send -a osd -h string:x-canonical-private-synchronous:osd "󰝟 Muted" #--expire-time=1500
    sleep 1.5 && swaync-client --close-latest
else
    notify-send -a osd -h string:x-canonical-private-synchronous:osd " Volume: $VOLUME%" #--expire-time=1500
    sleep 3 && swaync-client --close-latest
fi

