#!/bin/bash

HOUR=$((10#$(date +%H)))

if (( HOUR >= 6 && HOUR < 10 )); then
	ICON="󰖜"
	COLOR="#FFA500"
elif (( HOUR >= 10 && HOUR < 18 )); then
	ICON=""
	COLOR="#00BFFF"
elif (( HOUR >= 18 && HOUR < 22 )); then
	ICON="󰖛"
	COLOR="FF4500"
else
	ICON=""
	COLOR="#708090"
fi

echo "<span foreground=\"$COLOR\"><b>$ICON </b></span>"
