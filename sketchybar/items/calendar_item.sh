COLOR="$BLUE"

sketchybar --add item calendar right \
  --set calendar icon=􀉉 \
  update_freq=1 \
  background.height=26 \
  popup.drawing=off \
  padding_left=0 \
  padding_right=0 \
  icon.color="$COLOR" \
  icon.padding_left=10 \
  label.color="$COLOR" \
  label.padding_right=10 \
  background.corner_radius="$CORNER_RADIUS" \
  background.padding_left=5 \
  background.padding_right=5 \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BASE" \
  background.color="$CRUST" \
  background.drawing=on \
  script="$PLUGIN_DIR/calendar.sh"
