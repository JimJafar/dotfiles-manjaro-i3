#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Make the bar load properly on multiple monitors
# https://github.com/jaagr/polybar/issues/763#issuecomment-331604987
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload jim &
  done
else
  polybar --reload jim &
fi

echo "Bars launched..."
