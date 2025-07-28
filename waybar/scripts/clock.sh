#!/bin/bash

HOUR=$(date +%H)

if (( 6 <= HOUR && HOUR < 10 )); then
    ICON=""  # Matin
elif (( 10 <= HOUR && HOUR < 18 )); then
    ICON=""  # Après-midi
elif (( 18 <= HOUR && HOUR < 22 )); then
    ICON=""  # Soir
else
    ICON=""  # Nuit
fi

TIME=$(date "+%H:%M:%S")

echo "${TIME} ${ICON} "
