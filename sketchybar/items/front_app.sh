#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar \
  --add item front_app left \
  --set front_app script="$PLUGIN_DIR/front_app.sh" \
  icon.drawing=off \
  background.height=26 \
  background.padding_left=5 \
  background.padding_right=5 \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BASE" \
  background.corner_radius="$CORNER_RADIUS" \
  background.color="$CRUST" \
  label.color="$COLOR" \
  label.padding_left=10 \
  label.padding_right=10 \
  associated_display=1 \
  --subscribe front_app front_app_switched
