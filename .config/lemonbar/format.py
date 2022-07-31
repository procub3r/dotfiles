#!/bin/python3 -u

date = ''

while True:
    line = input()
    if line == 'CLOSE':
        break
    print(f'%{{c}}{line}')
