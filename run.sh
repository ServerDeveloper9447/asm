#!/bin/sh
USE_GCC=0
FILE=""

for arg in "$@"; do
    if [ "$arg" = "--gcc" ]; then
        USE_GCC=1
    else
        FILE="$arg"
    fi
done

if [ -z "$FILE" ]; then
    echo "Usage: ./run.sh [--gcc] <filename.asm>"
    exit 1
fi

FILENAME=$(basename "$FILE" .asm)

nasm -f elf64 "$FILE" -o "$FILENAME.o"

if [ $? -ne 0 ]; then
    echo "Assembly failed"
    exit 1
fi

if [ "$USE_GCC" -eq 1 ]; then
    gcc "$FILENAME.o" -o "$FILENAME"
else
    ld "$FILENAME.o" -o "$FILENAME"
fi

if [ $? -ne 0 ]; then
    echo "Linking failed"
    exit 1
fi