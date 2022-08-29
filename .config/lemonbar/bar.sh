#!/bin/bash

height=20
fifo=/tmp/bar_fifo
dcount=$(bspc query -D | wc -l) # desktop count

trap "trap - TERM; kill 0" INT TERM QUIT EXIT

[ -e $fifo ] && rm $fifo
mkfifo $fifo

while :; do
    echo "D$(date '+%I:%M:%S %p')" > $fifo
    sleep 1
done &

while :; do
    echo "B$(acpi -b)" > $fifo
    sleep 20
done &

while read -r line; do
    echo $line > $fifo
done < <(bspc subscribe report) &

tail --follow=name $fifo | while read -r line; do
    case $line in
        D*)
            date=${line:1} ;;
        W*)
            wm=${line//[^oOfF]/}
            wm=${wm::$dcount}
            wm=${wm//o/ _ }
            wm=${wm//f/ . }
            wm=${wm//[OF]/ - } ;;
        B*)
            battery=${line:1} ;;
        *) ;;
    esac
    echo "%{l}$wm%{c}$date%{r}$battery" || exit # exit if pipe to lemonbar is closed
done | lemonbar -g x$height -B "#21232b" -f "Cascadia Mono-8"
