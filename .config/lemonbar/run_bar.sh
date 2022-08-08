#!/bin/sh

HEIGHT=20
FIFO=/tmp/bar_fifo
FORMAT=~/.config/lemonbar/format_bar.py

trap "trap - TERM; kill 0" INT TERM QUIT EXIT

[ -e $FIFO ] && rm $FIFO
mkfifo $FIFO

while :; do echo "%{c}$(date '+%I:%M %p')" > $FIFO; sleep 1; done &

tail -F $FIFO | lemonbar -g x$HEIGHT -B "#21232b" -f "mononoki Nerd Font-10"
