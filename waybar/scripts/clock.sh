#!/bin/bash

HOUR=$((10#$(date +%H)))

if (( 6 <= HOUR && HOUR < 10 )); then
    ICON="󰖜"  # Matin
    COLOR="#FF66CC"
elif (( 10 <= HOUR && HOUR < 18 )); then
    ICON="" # Après-midi
    COLOR="#FFF6A3"
elif (( 18 <= HOUR && HOUR < 22 )); then
    ICON=""  # Soir
    COLOR="#D4E2F0"
else
    ICON=""  # Nuit
    COLOR="#667EFC"
fi

TIME=$(date "+%H:%M")

echo "<span color='${COLOR}'>${ICON}  ${TIME}</span>"
