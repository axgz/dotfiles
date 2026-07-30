return [[
    opts="Lock\nLogout\nReboot\nShutdown"
    chosen=$(echo -e "$opts" | hyprlauncher --dmenu)
    case $chosen in
      *"Lock") hyprlock ;;
      *"Logout") hyprshutdown ;;
      *"Reboot") hyprshutdown --post-cmd "systemctl reboot" ;;
      *"Shutdown") hyprshutdown --post-cmd "systemctl poweroff" ;;
    esac
]]
