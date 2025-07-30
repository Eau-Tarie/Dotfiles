#!/bin/bash

HOURFORMATTED=$((10#$(date +%H)))
HOUR=$(date +%H)
if (( HOURFORMATTED >= 6 && HOURFORMATTED < 10 )); then
    COLOR="#FFA500"
elif (( HOURFORMATTED >= 10 && HOURFORMATTED < 18 )); then
    COLOR="#00BFFF"
elif (( HOURFORMATTED >= 18 && HOURFORMATTED < 22 )); then
    COLOR="#FF4500"
else
    COLOR="#708090"
fi

echo "<span foreground=\"$COLOR\"><b>$HOUR</b></span>"
