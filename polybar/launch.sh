#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch primary and secondary bars
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/polybar/config-primary.ini center &
  done
else
  polybar -c ~/.config/polybar/config-primary.ini center &
fi

polybar -c ~/.config/polybar/config-primary.ini center

