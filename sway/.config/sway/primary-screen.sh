#!/usr/bin/env bash

DSP=$(xrandr | awk '/3440x1440/ {print $1}' | head -n 1)

xrandr --output $DSP --primary
echo "Xwayland: Primary monitor set"
