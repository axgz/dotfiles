-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    -- Set global dark mode for GTK4/Libadwaita apps (like GNOME Calendar)
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd("swaync")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar & hyprpaper & hypridle")
    hl.exec_cmd("hyprlauncher --daemon")
    hl.exec_cmd(terminal)
    hl.exec_cmd(browser)
end)
