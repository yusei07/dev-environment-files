#!/usr/bin/env bash

# Shows "Track — Artist" while Spotify is playing; hidden otherwise.
# Checks with pgrep first so this never launches Spotify.

if ! pgrep -xq Spotify; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)

if [ "$STATE" = "playing" ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track' 2>/dev/null)
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track' 2>/dev/null)
  sketchybar --set "$NAME" drawing=on label="$TRACK — $ARTIST"
else
  sketchybar --set "$NAME" drawing=off
fi
