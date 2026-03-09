#!/bin/bash
chosen=$(printf "󰐥  Power Off\n󰒲  Sleep\n󰤄  Hibernate\n󰌾  Lock\n󰍃  Log Out" | wofi \
  --dmenu \
  --prompt "Power" \
  --width 250 \
  --height 235 \
  --style ~/.config/wofi/keybind-style.css)

case "$chosen" in
*"Power Off") systemctl poweroff ;;
*"Sleep") systemctl suspend ;;
*"Hibernate") systemctl hibernate ;;
*"Lock") loginctl lock-session ;;
*"Log Out") swaymsg exit ;;
esac
