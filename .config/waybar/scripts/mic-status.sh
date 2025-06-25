#!/bin/bash

if pactl get-source-mute alsa_input.pci-0000_00_1f.3.analog-stereo | grep -q "yes"; then
    echo " "  # Muted
else
    echo ""  # Unmuted
fi

