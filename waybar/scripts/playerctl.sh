#!/bin/bash

state=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Default icon
icon="󰝚"

if [ "$state" = "Playing" ]; then
  icon="󰐊"
elif [ "$state" = "Paused" ]; then
  icon="󰏤"
else
  echo "{\"text\":\"󰝚\",\"tooltip\":\"No media\"}"
  exit
fi

# Build text
text="$icon"

# Optional: show song info if available
if [ -n "$title" ]; then
  text="$icon $title"
fi

echo "{\"text\":\"$text\",\"tooltip\":\"$artist - $title\"}"
