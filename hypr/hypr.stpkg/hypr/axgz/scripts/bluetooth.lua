return [[
    # Check power state
    state=$(bluetoothctl show | grep Powered | awk '{print $2}')

    if [ "$state" = "yes" ]; then
      # List devices (simplified parsing)
      devices=$(bluetoothctl devices | while read -r line; do
        mac=$(echo $line | awk '{print $2}')
        name=$(echo $line | cut -d' ' -f2-)
        # Check if connected
        if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
          echo "🔵 name [Connected]"
        else
          echo "⚪ $name"
        fi
      done)
      entries="$devices\nToggle Bluetooth Off\nCancel"
    else
      entries="Toggle Bluetooth On\nCancel"
    fi

    chosen=$(echo -e "$entries" | hyprlauncher --dmenu)

    case "$chosen" in
      *"Exited without selection") exit 0;;

      *"Toggle Bluetooth On")
        bluetoothctl power on && notify-send "Bluetooth Enabled"
        ;;
      *"Toggle Bluetooth Off")
        bluetoothctl power off && notify-send "Bluetooth Disabled"
        ;;
      "Cancel") exit 0 ;;
      *)
        # Extract name (remove status icons)
        dev_name=$(echo "$chosen" | sed 's/.*⚪ //' | sed 's/.*🔵 //' | sed 's/ \[Connected\]//')
        # Find MAC address
        mac=$(bluetoothctl devices | grep "$dev_name" | awk '{print $2}')

        if echo "$chosen" | grep -q "\[Connected\]"; then
          bluetoothctl disconnect "$mac" && notify-send "Disconnected $dev_name"
        else
          bluetoothctl connect "$mac" && notify-send "Connected $dev_name"
        fi
        ;;
    esac
]]
