#!/bin/bash
export LIBVA_DRIVER_NAME=iHD
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland
exec brave --enable-features=VaapiVideoDecoder --ozone-platform=wayland --enable-zero-copy "$@"
