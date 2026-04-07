#!/bin/bash

get_status() {
  CURRENT=$(powerprofilesctl get)
  case $CURRENT in
  "power-saver")
    echo '{"text": "🐢", "tooltip": "Power Saver", "class": "power-saver"}'
    ;;
  "balanced")
    echo '{"text": "⚡", "tooltip": "Balanced", "class": "balanced"}'
    ;;
  "performance")
    echo '{"text": "🚀", "tooltip": "Performance", "class": "performance"}'
    ;;
  esac
}

cycle_profile() {
  CURRENT=$(powerprofilesctl get)
  case $CURRENT in
  "power-saver")
    powerprofilesctl set balanced
    ;;
  "balanced")
    powerprofilesctl set performance
    ;;
  "performance")
    powerprofilesctl set power-saver
    ;;
  esac
}

case $1 in
--status) get_status ;;
--cycle) cycle_profile ;;
*) get_status ;;
esac
