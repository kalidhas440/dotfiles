#!/bin/bash

LAST_SHUTDOWN=$(journalctl --list-boots | tail -2 | head -1 | awk '{print $1}')
CRASHED=$(journalctl -b "$LAST_SHUTDOWN" -n 50 | grep -i "unexpected shutdown")

if [[ -n "$CRASHED" ]]; then
    brave --restore-last-session &
fi

