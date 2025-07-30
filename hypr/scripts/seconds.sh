#!/bin/bash

HOUR=$((10#$(date +%H)))
SECOND=$(date +%S)

if (( HOUR >= 6 && HOUR < 10 )); then
    COLOR="#FFA500"
elif (( HOUR >= 10 && HOUR < 18 )); then
    COLOR="#00BFFF"
elif (( HOUR >= 18 && HOUR < 22 )); then
    COLOR="#FF4500"
else
    COLOR="#708090"
fi

echo "<span foreground=\"$COLOR\"><b>$SECOND</b></span>"
