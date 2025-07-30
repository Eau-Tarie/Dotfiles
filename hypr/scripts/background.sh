#!/bin/bash

#!/bin/bash

# Dossiers de wallpapers classés par moment de la journée
WALL_DIR="$HOME/assets/wallpapers"

HOUR=$((10#$(date +%H)))

if (( HOUR >= 6 && HOUR < 10 )); then
    SUBDIR="sunrise"
elif (( HOUR >= 10 && HOUR < 18 )); then
    SUBDIR="day"
elif (( HOUR >= 18 && HOUR < 22 )); then
    SUBDIR="sunset"
else
    SUBDIR="night"
fi

TARGET_DIR="$WALL_DIR/$SUBDIR"

IMAGE=$(find "$TARGET_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

cp "$IMAGE" "$HOME/assets/wallpapers/current-background.png"
echo "$HOUR | $TARGET_DIR"
