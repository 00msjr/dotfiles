#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item cpu right \
  --set cpu \
  update_freq=3 \
  icon.color="$COLOR" \
  icon.padding_left=10 \
  label.color="$COLOR" \
  label.padding_right=10 \
  background.height=26 \
  background.padding_left=5 \
  background.padding_right=5 \
  background.corner_radius="$CORNER_RADIUS" \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BASE" \
  background.color="$CRUST" \
  background.drawing=on \
  script="$PLUGIN_DIR/cpu.sh"
