#!/bin/bash
SOURCE_ID=55

if wpctl get-volume "$SOURCE_ID" | grep -q MUTED; then
    echo " "
else
    echo ""
fi

