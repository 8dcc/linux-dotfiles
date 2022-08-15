#!/bin/sh

status="$(xrandr --query --verbose | grep "LVDS1" | cut -d ' ' -f 6)"
deviceid="15"  # xsetwacom list


if [[ $status == "normal" ]]; then
	xrandr -o 1
	xsetwacom set $deviceid Rotate ccw
elif [[ $status == "left" ]]; then
	xrandr -o 2
	xsetwacom set $deviceid Rotate half
elif [[ $status == "inverted" ]]; then
	xrandr -o 3
	xsetwacom set $deviceid Rotate cw
elif [[ $status == "right" ]]; then
	xrandr -o 0
	xsetwacom set $deviceid Rotate none
else
	echo "What" > ~/.rot-errors.log
fi
