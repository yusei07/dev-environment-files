#!/usr/bin/env bash

# Maps an app name to a sketchybar-app-font ligature, stored in $ICON.
# (Sets a variable instead of echoing so callers don't need a subshell — faster.)
# Full list: https://github.com/kvndrsslr/sketchybar-app-font
# Add a case here when an app shows the default icon.

icon_map() {
  case "$1" in
    "iTerm2" | "iTerm") ICON=":iterm:" ;;
    "Terminal") ICON=":terminal:" ;;
    "Claude") ICON=":claude:" ;;
    "Google Chrome") ICON=":google_chrome:" ;;
    "Obsidian") ICON=":obsidian:" ;;
    "Notion") ICON=":notion:" ;;
    "Spotify") ICON=":spotify:" ;;
    "WhatsApp" | "‎WhatsApp") ICON=":whats_app:" ;;
    "Finder") ICON=":finder:" ;;
    "System Settings" | "System Preferences") ICON=":gear:" ;;
    "Activity Monitor") ICON=":activity_monitor:" ;;
    "Karabiner-Elements" | "Karabiner-Elements Settings") ICON=":karabiner_elements:" ;;
    "Raycast") ICON=":raycast:" ;;
    "QuickTime Player") ICON=":quicktime:" ;;
    "Calendar") ICON=":calendar:" ;;
    "Safari") ICON=":safari:" ;;
    "Code" | "Visual Studio Code") ICON=":code:" ;;
    "Slack") ICON=":slack:" ;;
    "Discord") ICON=":discord:" ;;
    "Mail") ICON=":mail:" ;;
    "Messages") ICON=":messages:" ;;
    "Preview") ICON=":preview:" ;;
    "Docker Desktop" | "Docker") ICON=":docker:" ;;
    *) ICON=":default:" ;;
  esac
}
