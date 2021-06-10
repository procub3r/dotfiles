import json

with open('compile_commands.json', 'r') as f:
    contents = f.readlines()
    contents[0] = '[' + contents[0]
    contents[-1] = contents[-1][:-2] + ']'

with open('compile_commands.json', 'w') as f:
    for line in contents:
        f.writelines(line)

