#!/bin/bash

# Update the date
DATETIME=$(date '+%a %d. %b %I:%M %p')

# Update the sketchybar item
sketchybar --set calendar label="$DATETIME"
