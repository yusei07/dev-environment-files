#!/usr/bin/env bash

# Refreshes all workspace items: shows workspaces that have windows (plus the
# focused one), highlights the focused one, and lists each workspace's app icons.
#
# $1 is the space-separated workspace list, computed once in sketchybarrc.
# Kept bash 3.2 compatible (macOS /bin/bash): no associative arrays, so
# per-workspace values live in dynamically named variables (ICONS_<ws>, MON_<ws>).
# Avoids subshells/forks in loops — this runs on every workspace switch.

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/plugins/icon_map.sh"

WORKSPACES="$1"
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

# Fast path: move the highlight immediately, before the slower full refresh below.
if [ -n "$PREV_WORKSPACE" ] && [ "$PREV_WORKSPACE" != "$FOCUSED" ]; then
  sketchybar --set space.$FOCUSED drawing=on background.color=$ACCENT background.border_color=$ACCENT icon.color=$BG0 label.color=$BG0 \
             --set space.$PREV_WORKSPACE background.color=$ITEM_BG background.border_color=$BORDER icon.color=$FG label.color=$GREY
fi

while IFS='|' read -r ws app; do
  [ -z "$ws" ] && continue
  icon_map "$app"
  var="ICONS_$ws"
  # One icon per app, even with several windows
  case " ${!var} " in *" $ICON "*) ;; *) printf -v "$var" '%s' "${!var} $ICON" ;; esac
done < <(aerospace list-windows --all --format '%{workspace}|%{app-name}')

while IFS='|' read -r ws mon; do
  [ -n "$ws" ] && printf -v "MON_$ws" '%s' "$mon"
done < <(aerospace list-workspaces --monitor all --format '%{workspace}|%{monitor-appkit-nsscreen-screens-id}')

args=()
for sid in $WORKSPACES; do
  var="ICONS_$sid"; icons="${!var# }"
  var="MON_$sid"; display="${!var:-active}"

  if [ "$sid" = "$FOCUSED" ]; then
    if [ -n "$icons" ]; then label_drawing=on; else label_drawing=off; fi
    args+=(--set space.$sid drawing=on
           display="$display"
           background.color=$ACCENT
           background.border_color=$ACCENT
           icon.color=$BG0
           label.color=$BG0
           label="$icons"
           label.drawing=$label_drawing)
  elif [ -n "$icons" ]; then
    args+=(--set space.$sid drawing=on
           display="$display"
           background.color=$ITEM_BG
           background.border_color=$BORDER
           icon.color=$FG
           label.color=$GREY
           label="$icons"
           label.drawing=on)
  else
    args+=(--set space.$sid drawing=off)
  fi
done

sketchybar "${args[@]}"
