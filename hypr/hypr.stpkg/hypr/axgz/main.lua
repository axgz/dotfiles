require("axgz.programs")
require("axgz.monitors")
require("axgz.autostart")
require("axgz.permissions")
require("axgz.bindings")
require("axgz.workspaces")
require("axgz.input")
require("axgz.lookfeel")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper         = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo           = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_hyprland_guiutils_check = true
    },
})
