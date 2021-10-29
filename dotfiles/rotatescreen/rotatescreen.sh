#!/bin/sh

status="$(xrandr --query --verbose | grep "LVDS1" | cut -d ' ' -f 6)"

if [[ $status == "normal" ]]; then
	xrandr -o 1
elif [[ $status == "left" ]]; then
	xrandr -o 2
elif [[ $status == "inverted" ]]; then
	xrandr -o 3
elif [[ $status == "right" ]]; then
	xrandr -o 0
else
	echo "What" > ~/.rot-errors.log
fi
