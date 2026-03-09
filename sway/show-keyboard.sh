#!/bin/bash
# Parses your sway config and shows all bindsym lines in wofi

grep -E '^\s*bindsym' ~/.config/sway/config |
  sed 's/^\s*bindsym //' |
  sed 's/exec //' |
  column -t |
  wofi \
    --dmenu \
    --prompt "Keybinds" \
    --width 700 \
    --height 500 \
    --style ~/.config/wofi/keybind-style.css
