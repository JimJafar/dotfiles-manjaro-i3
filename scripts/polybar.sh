#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  # Make the bar load properly on multiple monitors
  # https://github.com/jaagr/polybar/issues/763#issuecomment-331604987
  # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  #  MONITOR=$m polybar --reload jim &
  # done

  # Display the polybar only on the primary monitor
  MONITOR=$(xrandr --query | grep " primary" | cut -d" " -f1) polybar --reload jim &
else
  polybar --reload jim &
fi

echo "Bars launched..."
