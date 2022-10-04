#!/bin/sh

#######################
position="bottom-right"  # top-right / bottom-right
font="dina:size=9"
#######################

if [[ $position == "top-right" ]]; then
	g_param="91x1-10+30"
elif [[ $position == "bottom-right" ]]; then
	g_param="91x1-10-10"
fi

# Execute the terminal
st -i -t "LCD" -f $font -g $g_param -e bash ~/.LCD-command.sh



