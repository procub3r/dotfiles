#!/bin/sh

BAR_DIR=/tmp/bar_dir
BAR_FIFO=$BAR_DIR/bar_fifo
BAR_HEIGHT=20
FORMAT_SCRIPT=~/.config/lemonbar/format_bar.py

[ -e $BAR_DIR ] && echo CLOSE > $BAR_FIFO && rm -r $BAR_DIR
mkdir $BAR_DIR
mkfifo $BAR_FIFO

# launch lemonbar
tail -F $BAR_FIFO | $FORMAT_SCRIPT | lemonbar -g x$BAR_HEIGHT+0+0 | sh &

# update date
while :; do echo "D$(date +"%I:%M %p")" > $BAR_FIFO; sleep 1; done &

# update battery info
STATUS=/sys/class/power_supply/BAT0/status
CAPACITY=/sys/class/power_supply/BAT0/capacity
while :; do echo "B$(cat $STATUS), $(cat $CAPACITY)%" > $BAR_FIFO; sleep 10; done &
