#!/usr/bin/env bash

# "Blue night" — tuned to the blue wallpaper (#4866a5 fading to navy #1a2035).
# Pills are translucent navy so they blend into the wallpaper; the only strong
# color is the lavender accent on the focused workspace (see ACCENT below).
# Format: 0xAARRGGBB

export BG0=0xff141a2b      # text on top of the accent
export FG=0xffe3e9f6       # main text
export GREY=0xff9fb0d4     # dimmed text / icons

export RED=0xffff8a8a
export ORANGE=0xffffb27a
export YELLOW=0xfff6c177
export GREEN=0xffa6dcb4
export BLUE=0xffa9c7ff
export AQUA=0xff9fdcf0

export TRANSPARENT=0x00000000
export BAR_COLOR=0x00000000
#export ITEM_BG=0x59141a2b  # navy at ~35% opacity
export ITEM_BG=$TRANSPARENT # pills: no fill, outline only (see BORDER)
export BORDER=0xffffffff    # white outline around every pill
export ICE=0xffdce6ff

export ACCENT=$ICE          # focused workspace: solid fill in this color (text uses BG0)
