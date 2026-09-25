#!/usr/bin/env bash

# $INFO holds the focused app's name on front_app_switched.

source "$CONFIG_DIR/plugins/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  icon_map "$INFO"
  sketchybar --set "$NAME" icon="$ICON" label="$INFO"
fi
