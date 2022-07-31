#!/usr/bin/python3 -u

import os

# variables
date = ''
battery = ''
wm = '  %{A4:bspc desktop -f prev.local:}%{A5:bspc desktop -f next.local:}1 2 3 4 5%{A}%{A}'

# run forever
while True:
    # take input
    line = input()

    # update variables
    if line[0] == 'D':
        date = line[1:]

    elif line[0] == 'B':
        battery = line[1:]

    elif line == 'CLOSE':
        os.system('pkill run_bar.sh')
        os.system('rm -r /tmp/bar_dir/')
        break

    # finally, print the format string
    print(f'%{{l}}{wm}%{{c}}{date}%{{r}}{battery}  ')
