#!/bin/bash

HOUR=$(date +%H)

if (( HOUR >= 6 && HOUR < 10 )); then
    ICON="󰖜"
    GREETING="Good morning"
    COLOR="#FFA500"
elif (( HOUR >= 10 && HOUR < 18 )); then
    ICON=""
    GREETING="Good afternoon"
    COLOR="#00BFFF"
elif (( HOUR >= 18 && HOUR < 22 )); then
    ICON="󰖛"
    GREETING="Good evening"
    COLOR="#FF4500"
else
    ICON=""
    GREETING="Good night"
    COLOR="#708090"
fi

USER_CAPITALIZED="$(tr '[:lower:]' '[:upper:]' <<< ${USER:0:1})${USER:1}"

echo "<span foreground=\"$COLOR\"><b>$ICON </b><b>$GREETING</b></span> <span text-transform=\"capitalize\">$USER_CAPITALIZED</span> !"

