#!/bin/bash

HOUR=$((10#$(date +%H)))

if (( HOUR >= 6 && HOUR < 10 )); then
    ICON="󰖜"
    GREETING="Good morning"
    COLOR="#FF66CC"
elif (( HOUR >= 10 && HOUR < 18 )); then
    ICON=""
    GREETING="Good afternoon"
    COLOR="#FF4500"
elif (( HOUR >= 18 && HOUR < 22 )); then
    ICON="󰖛"
    GREETING="Good evening"
    COLOR="#D4E2F0"
else
    ICON=""
    GREETING="Good night"
    COLOR="#667EFC"
fi

USER_CAPITALIZED="$(tr '[:lower:]' '[:upper:]' <<< ${USER:0:1})${USER:1}"

echo "<span foreground=\"$COLOR\"><b>$ICON </b><b>$GREETING</b></span> <span text-transform=\"capitalize\">$USER_CAPITALIZED</span> !"

