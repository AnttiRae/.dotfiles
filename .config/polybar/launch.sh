#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" | tee -a /tmp/polybar.log
polybar bar1 -r >>/tmp/polybar1.log 2>&1 & disown

echo "Bars launched..."
