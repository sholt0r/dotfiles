#!/usr/bin/env bash

WATCH_DIR="$HOME/Downloads"
ICA_CLIENT_BIN="/opt/Citrix/ICAClient/wfica"
NOTIFY_BIN="/usr/bin/notify-send"
USER_ID=$(id -u)
DBUS_ENV="unix:path=/run/user/$USER_ID/bus"

export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS="$DBUS_ENV"
export XDG_RUNTIME_DIR="/run/user/$USER_ID"

inotifywait -m -e close_write --format "%f" --include '^[^.].*\.[iI][cC][aA]$' "$WATCH_DIR" | while read -r FILENAME; do
  FULL_PATH="$WATCH_DIR/$FILENAME"

  # Attempt to open ICA and get service status
  "$ICA_CLIENT_BIN" "$FULL_PATH" &
  PID=$!
  wait "$PID"
  STATUS=$?

  # Check if running and if not send a notification
  if [[ $STATUS -eq 0 ]]; then
    rm -f -- "$FULL_PATH"
    echo "Opened and deleted: $FULL_PATH"
  else
    rm -f -- "$FULL_PATH"
    echo "Failed to open: $FULL_PATH (exit code: $STATUS)"
    [[ -x "$NOTIFY_BIN" ]] && "$NOTIFY_BIN" "Citrix Failed to Launch" "Could not open: $FILENAME"
  fi

done
