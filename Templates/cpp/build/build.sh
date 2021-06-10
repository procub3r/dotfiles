clang++ -g -I include/ -o bin/main src/*.cpp -MJ compile_commands.json
python build/stitch_compile_commands.py
