#!/bin/bash

# CONFIGURATION
REMOTE_USER="YOUR_SERVER_HOST"
REMOTE_HOST="YOUR_SERVER_IP"
REMOTE_HOST_VPN="YOUR_SERVER_VPN_IP"

#directories remote
REMOTE_CODE=""
REMOTE_NOTES=""
REMOTE_SCRIPTS=""
REMOTE_PERSONAL=""

#directories local
LOCAL_CODE="/home/$USER/code"
LOCAL_NOTES="/home/$USER/notes"
LOCAL_SCRIPTS="/home/$USER/scripts"
LOCAL_PERSONAL="/home/$USER/personal"

# Ensure an argument is provided
if [[ -z "${1:-}" ]]; then
  echo "Usage: $0 <1 for VPN | 0 for LAN>"
  exit 1
fi

# Common rsync options (use array → safer)
RSYNC_OPTS=(
  -azvuh
  --update
  --progress
  --exclude="venv/"
  --exclude=".git/"
  --exclude="gui/"
  --rsync-path="sudo rsync"
)

# VPN condition
if [[ "$1" -eq 1 ]]; then
  TARGET_HOST="$REMOTE_HOST_VPN"
elif [[ "$1" -eq 0 ]]; then
  TARGET_HOST="$REMOTE_HOST"
else
  echo "Invalid argument: use 1 (VPN) or 0 (LAN)"
  exit 1
fi

# Function to sync and label output
sync_dir() {
  local name="$1"
  local local_path="$2"
  local remote_path="$3"
  echo "Syncing $name..."
  if rsync --exclude-from='excludefrom.txt' "${RSYNC_OPTS[@]}" \
    "${local_path}" \
    "${REMOTE_USER}@${TARGET_HOST}:${remote_path}"; then
    echo "$name sync completed"
  else
    echo "$name sync failed!" >&2
    exit 1
  fi
}
# Run all syncs
sync_dir "CODE" "$LOCAL_CODE" "$REMOTE_CODE"
sync_dir "NOTES" "$LOCAL_NOTES" "$REMOTE_NOTES"
sync_dir "SCRIPTS" "$LOCAL_SCRIPTS" "$REMOTE_SCRIPTS"
sync_dir "PERSONAL" "$LOCAL_PERSONAL" "$REMOTE_PERSONAL"
