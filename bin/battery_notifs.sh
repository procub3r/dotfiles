#!/bin/bash

notify-send "battery_notifs.sh" "Started running in the background"

while true; do
    per=$(acpi | cut -d " " -f 4)
    per=${per%\%,}
    stat=$(acpi | cut -d " " -f 3)

    if [ $per -gt 80 ] && [ $stat == "Charging," ]; then
        notify-send "battery_notifs.sh" "Battery charged over 80% Unplug!" --urgency=low
    elif [ $per -lt 40 ] && [ $stat == "Discharging," ]; then
        notify-send "battery_notifs.sh" "Battery drained below 40% Plug!" --urgency=critical
    fi

    sleep 300
done
