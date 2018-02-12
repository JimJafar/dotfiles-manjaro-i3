#!/usr/bin/env bash

# Set natural scrolling on trackpad
TOUCHPADID=`xinput list|grep Touchpad|grep -m 1 id=|cut -f 2|cut -f 2 -d =`
xinput set-prop "${TOUCHPADID}" `xinput list-props "${TOUCHPADID}"|grep -m 1 "Natural Scrolling Enabled"|grep -oP '\(\K[^\)]+'` 1

# Set natural scrolling on mouse
MOUSEID=`xinput list|grep mouse|grep -m 1 id=|cut -f 2|cut -f 2 -d =`
xinput set-prop "${MOUSEID}" `xinput list-props "${MOUSEID}"|grep -m 1 "Natural Scrolling Enabled"|grep -oP '\(\K[^\)]+'` 1
