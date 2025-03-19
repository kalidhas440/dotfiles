#!/bin/bash
VOLUME=$(pamixer --get-volume)

if pamixer --get-mute | grep -q true; then
    notify-send "󰝟 Muted" --expire-time=1000
else
    notify-send " Volume: $VOLUME%" --expire-time=1000
fi

