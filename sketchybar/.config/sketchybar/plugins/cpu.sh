#!/usr/bin/env bash

# Total CPU usage across all processes, normalised by core count.

CORES=$(sysctl -n hw.ncpu)
USAGE=$(ps -A -o %cpu= | awk -v cores="$CORES" '{ s += $1 } END { printf "%d", s / cores }')

sketchybar --set "$NAME" label="${USAGE}%"
