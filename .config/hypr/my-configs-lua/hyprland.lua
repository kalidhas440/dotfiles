-- Initialize the Hyprland API core binding
local hl = require("hl")

-- Import your sub-configurations (Order matters!)
-- 1. Setup system environments first
require("my-configs.env-variables")

-- 2. Hardware and Visual settings
require("my-configs.input-output")
require("my-configs.looknfeel")

-- 3. Layout, Window rules, and Keybindings
require("my-configs.windows-workspaces")
require("my-configs.keybindings")

-- 4. Launch your autostart apps last
require("my-configs.autostart")

-- Note: Wildcard matching like "caelestia-configs/*" isn't natively supported
-- by Lua's require. You must explicitly require each file individually.
