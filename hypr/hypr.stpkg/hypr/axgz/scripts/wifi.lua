return [[
    # Rescan and get list
    nmcli device wifi rescan
    list=$(nmcli -g ssid device wifi list | sort -u)

    # Show menu
    chosen=$(echo "$list" | hyprlauncher --dmenu)

    case $chosen in
        *"Exited without selection") exit 0 ;;
    esac

    # 1. Try direct connection (works for saved/open networks)
    if nmcli device wifi connect "$chosen" > /dev/null 2>&1; then
      notify-send "WiFi Connected" "$chosen"
      exit 0
    fi

    # 2. If direct fail, assume password needed.
    # Launch a terminal to ask securely using nmcli --ask
    # Replace "kitty" with your terminal emulator if different
    notify-send "WiFi" "Password required for $chosen"
    kitty -e sh -c "
      echo \"Connecting to $chosen...\";
      if nmcli --ask device wifi connect \"$chosen\"; then
        echo \"Success! You can close this window.\";
        notify-send \"WiFi Connected\" \"$chosen\";
        sleep 2;
      else
        echo \"Failed to connect.\";
        notify-send \"WiFi Failed\" \"Could not connect to $chosen\";
        sleep 2;
      fi
    "
]]

