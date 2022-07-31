#!/bin/sh

BAR_FIFO=/tmp/bar_fifo
BAR_HEIGHT=20
FORMAT_SCRIPT=~/.config/lemonbar/format.py

[ -e $BAR_FIFO ] && rm $BAR_FIFO
mkfifo $BAR_FIFO

tail -F $BAR_FIFO | $FORMAT_SCRIPT | lemonbar -d -g x$BAR_HEIGHT -B "#21232b" -F "#ffffff" -f "mononoki Nerd Font Mono-10" | sh &

while :; do date +"%I:%M %p" > $BAR_FIFO; sleep 1; done &
