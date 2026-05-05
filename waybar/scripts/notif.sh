#!/bin/bash

# Check DND state
if swaync-client -D | grep -q "true"; then
  echo "󰂛" # bell-off
else
  echo "󰂚" # bell
fi
