#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item apple.logo left \
  --set apple.logo icon=􀣺 \
  icon.color="$COLOR" \
  background.height=24 \
  popup.drawing=off \
  icon.padding_left=20 \
  icon.padding_right=20 \
  label.padding_left=0 \
  label.padding_right=0 \
  background.padding_left=5 \
  background.padding_right=5 \
  label.color="$BASE" \
  background.corner_radius="$CORNER_RADIUS" \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BASE" \
  background.color="$CRUST" \
  background.drawing=on \
  icon.font="$FONT:Black:22.0" \
  label.drawing=off \
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
  popup.background.border_width=2 \
  popup.background.corner_radius=6 \
  popup.background.border_color=$BASE \
  label.font="$FONT:Semibold:16.0" \
  \
  --add item apple.preferences popup.apple.logo \
  --set apple.preferences icon=􀺽 \
  label="Preferences" \
  click_script="open -a 'System Preferences';                    
                                             sketchybar -m --set apple.logo popup.drawing=off" \
  --add item apple.activity popup.apple.logo \
  --set apple.activity icon=􀒓 \
  label="Activity" \
  click_script="open -a 'Activity Monitor';                       
                                             sketchybar -m --set apple.logo popup.drawing=off" \
  --add item apple.lock popup.apple.logo \
  --set apple.lock icon=􀒳 \
  label="Lock Screen" \
  click_script="pmset displaysleepnow;                           
                                             sketchybar -m --set apple.logo popup.drawing=off"
