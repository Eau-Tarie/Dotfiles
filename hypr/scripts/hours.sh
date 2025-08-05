#!/bin/bash

HOURFORMATTED=$((10#$(date +%H)))
HOUR=$(date +%H)
if (( HOURFORMATTED >= 6 && HOURFORMATTED < 10 )); then
    COLOR="#FF66CC"
elif (( HOURFORMATTED >= 10 && HOURFORMATTED < 18 )); then
    COLOR="#FF4500"
elif (( HOURFORMATTED >= 18 && HOURFORMATTED < 22 )); then
    COLOR="#D4E2F0"
else
    COLOR="#667EFC"
fi

echo "<span foreground=\"$COLOR\"><b>$HOUR</b></span>"
