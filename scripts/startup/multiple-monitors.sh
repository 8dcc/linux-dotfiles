#!/bin/sh
xrandr --output 'HDMI-0' --mode 1920x1080 --pos 0x0 --rotate normal \
       --output 'DP-4' --mode 1920x1080 --pos 1920x0 --rotate normal --rate 144.00 --primary
