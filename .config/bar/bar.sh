#!/usr/bin/env bash

if xdo id -a "$PANEL_WM_NAME" > /dev/null; then
    printf "%s\n" "The bar is already running." >&2
    exit 1
fi

fifo=/tmp/bar-fifo
bg="#e51d2021"
fg="#d4be98"
height=22

trap 'trap - TERM; kill $(ps -s $$ -o pid=)' INT TERM QUIT EXIT

[ -e "$fifo" ] && rm "$fifo"
mkfifo "$fifo"

# wm
while read -r line; do
    echo $line > $fifo
done < <(bspc subscribe report) &

# window title
while read -r line; do
    echo $line > $fifo
done < <(xtitle -s -f "T%s\n" -t 80) &

# time & date
while :; do
    echo "D$(date '+%I:%M:%S %p < %a, %d %b')" > "$fifo"
    sleep 1
done &

# battery
while :; do
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    case $status in
        Charging) status="^" ;;
        Discharging) status="v" ;;
    esac
    echo "B$status$capacity%"
    sleep 10
done > "$fifo" &

# bar
while read -r line; do
    type=${line:0:1}
    line=${line:1}
    case $type in
        W)
            wm=
            IFS=":"
            items=($line)
            for i in "${items[@]}"; do
                val=${i:1}
                case $i in
                    o*) wm="$wm $val " ;;
                    O*) wm="$wm $val " ;;
                    f*) wm="$wm _ " ;;
                    F*) wm="$wm _ " ;;
                    u*) wm="$wm $val! " ;;
                    U*) wm="$wm $val! " ;;
                    L*)
                        case $val in
                            T) wm="$wm []= " ;; # tiled
                            M) wm="$wm [M] " ;; # monocle
                        esac ;;
                    T*)
                        case $val in
                            T) ;; # tiled
                            F) wm="$wm ><> " ;; # floating
                            P) wm="$wm ][= " ;; # pseudo-tiled
                            *) wm="$wm $val" ;;
                        esac ;;
                esac
            done ;;
        T) title=$line ;;
        B) battery=$line ;;
        D) date=$line ;;
    esac
    echo "%{l} $wm%{c}$title%{r}$battery < $date "
done < "$fifo" | lemonbar -n "$PANEL_WM_NAME" -g x"$height" -B "$bg" -F "$fg" -f "Iosevka Fixed-12" &

wid=$(xdo id -m -a "$PANEL_WM_NAME")
xdo above -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" "$wid"

echo $(pgrep -P $$) > /tmp/lol
wait
