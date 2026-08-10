local hl = require("hl")

-- Autostart
hl.on("hyprland.start", function()
    -- 1. Import environments first so subsequent apps can read them
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- 2. System services & daemons
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("gnome-keyring-daemon --start --components=pkcs11,secrets,ssh")
    hl.exec_cmd("mako")
    hl.exec_cmd("hypridle")

    -- 3. UI elements & indicators
    hl.exec_cmd("waybar -c ~/.config/waybar/config-hyprland.jsonc")
    hl.exec_cmd("swaybg -i " .. os.getenv("HOME") .. "/Pictures/Wallpapers/neon-girl-specs.png -m fill")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("copyq")
    hl.exec_cmd("kdeconnect-indicator")

    -- 4. Storage mounts (Using explicit HOME environment variable, no trailing ampersand)
    hl.exec_cmd("rclone mount EComp_Gdrive:" .. os.getenv("HOME") .. "/EComp_Gdrive --vfs-cache-mode writes --vfs-cache-max-size 2G")

    -- 5. User Applications
    hl.exec_cmd("brave-browser")
end)
