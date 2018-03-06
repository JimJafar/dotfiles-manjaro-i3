#!/usr/bin/env bash

#icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-deathnote.png"
#icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-homestuck-crew.png"

tmpbg='/tmp/screen.png'

revert() {
  xset dpms 0 0 0
}

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
convert "$tmpbg" -gravity center -composite -matte "$tmpbg"

# enable DPMS while the screen is locked
trap revert HUP INT TERM
xset +dpms dpms 10 20 30

# lock the screen
i3lock --nofork --image="$tmpbg"
# switch off DPMS
revert
