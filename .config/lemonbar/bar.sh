#!/bin/bash

height=20
fifo=/tmp/bar_fifo
dcount=$(bspc query -D | wc -l) # desktop count

trap "trap - TERM; kill 0" INT TERM QUIT EXIT

pkill lemonbar

[ -e $fifo ] && rm $fifo
mkfifo $fifo

# wm
while read -r line; do
    echo $line > $fifo
done < <(bspc subscribe report) &

# window title
while read -r line; do
    echo $line > $fifo
done < <(xtitle -s -f "T%s\n" -t 52) &

# date
while :; do
    echo "D$(date '+%I:%M:%S %p')" > $fifo
    sleep 1
done &

# battery
while :; do
    echo "B$(acpi -b)" > $fifo
    sleep 20
done &

wm_clickable_desktop() {
    echo "%{A:bspc desktop -f $1:} $2 %{A}"
}

wm_scrollable_desktops() {
    echo "%{A4:bspc desktop -f prev.local:}%{A5:bspc desktop -f next.local:}$1%{A}%{A}"
}

barbg="#21232b"
barfg="#e1e3e4"

wmfocusb="#9ed06c"
wmfocusf=$barbg
wmurgentb="#fb617e"
wmurgentf=$barbg

# read fifo > process and format > render with lemonbar
tail --follow=name $fifo | while read -r line; do
    case $line in
        D*) date=${line:1} ;;
        W*)
            state=${line//[^oOfF]/}
            state=${state::$dcount}
            wm=
            for (( i=0; i<${#state}; i++ )); do
                indx=$(($i+1))
                case ${state:$i:1} in
                    f)   wm="$wm$(wm_clickable_desktop $indx "_")" ;;
                    o)   wm="$wm$(wm_clickable_desktop $indx $indx)" ;;
                    u)   wm="$wm$(wm_clickable_desktop $indx "$indx!")" ;;
                    O|F) wm="$wm%{B$wmfocusb}%{F$wmfocusf}$(wm_clickable_desktop $indx $indx)%{F-}%{B-}" ;;
                    U)   wm="$wm%{B$wmurgentb}%{F$wmurgentf}$(wm_clickable_desktop $indx $indx)%{F-}%{B-}" ;;
                    *) ;;
                esac
            done
            wm=$(wm_scrollable_desktops "$wm") ;;
        T*) title=${line:1} ;;
        B*) battery=${line:1} ;;
        CLOSE) exit ;;
        *) ;;
    esac
    echo "%{l}$wm | $title%{c}$date%{r}$battery" || exit # exit if pipe to lemonbar is closed
done | lemonbar -g x$height -B $barbg -F $barfg -f "Cascadia Mono-10" | sh
