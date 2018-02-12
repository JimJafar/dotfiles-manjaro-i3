#!/usr/bin/env bash

#icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-deathnote.png"
icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-homestuck-crew.png"

tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
