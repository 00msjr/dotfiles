#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item music left \
  --set music \
  scroll_texts=on \
  icon=󰎆 \
  icon.color="$COLOR" \
  label.color="$COLOR" \
  icon.padding_left=10 \
  background.color="$CRUST" \
  background.height=26 \
  background.corner_radius="$CORNER_RADIUS" \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BASE" \
  background.padding_left=5 \
  background.padding_right=5 \
  background.drawing=on \
  label.padding_right=10 \
  label.max_chars=26 \
  associated_display=1 \
  updates=on \
  script="$PLUGIN_DIR/music.sh" \
  --subscribe music media_change
