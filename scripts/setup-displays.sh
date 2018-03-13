#!/usr/bin/env bash

#date > /home/jim/Documents/displ.log
echo $(xrandr | grep -oP '(HDMI1\sconnected)')
echo $(xrandr | grep -oP '(HDMI1\sdisconnected)')

if [ "$(xrandr | grep -o 'HDMI1\sconnected')" == "HDMI1 connected" ]; then
  echo 'External HDMI monitor found - setting up dual monitor output' #>> /home/jim/Documents/displ.log
  xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off
else
  echo 'No external HDMI monitor found - setting up single monitor output' #>> /home/jim/Documents/displ.log
  xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
fi
