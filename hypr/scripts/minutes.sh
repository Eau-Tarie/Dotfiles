#!/bin/bash

HOUR=$((10#$(date +%H)))
MINUTE=$(date +%M)

if (( HOUR >= 6 && HOUR < 10 )); then
    COLOR="#FF66CC"
elif (( HOUR >= 10 && HOUR < 18 )); then
    COLOR="#FF4500"
elif (( HOUR >= 18 && HOUR < 22 )); then
    COLOR="#D4E2F0"
else
    COLOR="#667EFC"
fi

echo "<span foreground=\"$COLOR\"><b>$MINUTE</b></span>"
