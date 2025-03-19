
#!/bin/bash
VOLUME=$(pamixer --get-volume)

if pamixer --get-mute | grep -q true; then
    echo "󰝟 Muted" | osd_cat -p middle -A center -d 5 -o 1
else
    echo " $VOLUME%" | osd_cat -p middle -A center -d 1 -o 5
fi
