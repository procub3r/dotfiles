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
done < <(xtitle -s -f "T%s\n" -t 80) &

# date
while :; do
    echo "D$(date '+%I:%M %p | %a, %d %b')" > $fifo
    sleep 1
done &

# # battery
# while :; do
#     echo "B$(acpi -b)" > $fifo
#     sleep 20
# done &

wm_clickable_desktop() {
    echo "%{A:bspc desktop -f $1:} $2 %{A}"
}

wm_scrollable_desktops() {
    echo "%{A4:bspc desktop -f prev.local:}%{A5:bspc desktop -f next.local:}$1%{A}%{A}"
}

wm_togglable_layout() {
    echo "%{A:bspc desktop -l next:}$1%{A}"
}

barbg="#21232b"
barfg="#e1e3e4"
grey="#666666"
red="#fb617e"

# read fifo > process and format > render with lemonbar
tail --follow=name $fifo | while read -r line; do
    case $line in
        D*) date=${line:1} ;;
        W*)
            wm=
            IFS=':'
            items=($line)
            for i in "${items[@]}"; do
                val=${i:1}
                case $i in
                    o*) wm="$wm%{F$grey}$(wm_clickable_desktop $val $val)%{F-}" ;;
                    f*) wm="$wm%{F$grey}$(wm_clickable_desktop $val "_")%{F-}" ;;
                    u*) wm="$wm%{F$red}$(wm_clickable_desktop $val "$val!")%{F-}" ;;
                    O*) wm="$wm$(wm_clickable_desktop $val $val)" ;;
                    F*) wm="$wm$(wm_clickable_desktop $val "_")" ;;
                    U*) wm="$wm$(wm_clickable_desktop $val "$val!")" ;;
                    L*)
                        case $val in
                            T) wm="$wm $(wm_togglable_layout "[]=")" ;; # tiled
                            M) wm="$wm $(wm_togglable_layout "[M]")" ;; # monocle
                        esac ;;
                    T*)
                        case $val in
                            T) ;; # tiled
                            F) wm="$wm ><>" ;; # floating
                            P) wm="$wm ][=" ;; # pseudo-tiled
                            *) wm="$wm $val" ;;
                        esac ;;
                    *) ;;
                esac
            done
            wm=$(wm_scrollable_desktops "$wm") ;;
        T*)
            title=${line:1}
            case $title in
                "") title="[PROCUB3R'S SYSTEM]" ;;
            esac ;;
        # B*) battery=${line:1} ;;
        CLOSE) exit ;;
        *) ;;
    esac
    echo -e "%{l}$wm%{c}$title%{r}$date " || exit # exit if pipe to lemonbar is closed
done | lemonbar -g x$height -B $barbg -F $barfg -f "Cascadia Mono-9.6" | sh
