#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

BATT="$(pmset -g batt)"
PERCENT="$(echo "$BATT" | grep -Eo '[0-9]+%' | tr -d '%')"
[ -z "$PERCENT" ] && exit 0

# Neutral unless low, so color only shows up when it matters
case "$PERCENT" in
  9[0-9] | 100) ICON=󰁹 COLOR=$GREY ;;
  [6-8][0-9]) ICON=󰂀 COLOR=$GREY ;;
  [3-5][0-9]) ICON=󰁾 COLOR=$GREY ;;
  [1-2][0-9]) ICON=󰁻 COLOR=$ORANGE ;;
  *) ICON=󰂎 COLOR=$RED ;;
esac

if echo "$BATT" | grep -q 'AC Power'; then
  ICON=󰂄
fi

sketchybar --set "$NAME" icon="$ICON" icon.color=$COLOR label="${PERCENT}%"
