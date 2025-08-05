#!/bin/bash

HOUR=$((10#$(date +%H)))

if (( HOUR >= 6 && HOUR < 10 )); then
	ICON="󰖜"
	COLOR="#FF66CC"
elif (( HOUR >= 10 && HOUR < 18 )); then
	ICON=""
	COLOR="#FF4500"
elif (( HOUR >= 18 && HOUR < 22 )); then
	ICON="󰖛"
	COLOR="#D4E2F0"
else
	ICON=""
	COLOR="#667EFC"
fi

echo "<span foreground=\"$COLOR\"><b>$ICON </b></span>"
