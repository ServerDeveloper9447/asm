#!/bin/sh
if [ -z "$1" ]; then
    echo "Usage: ./run.sh <filename.asm>"
    exit 1
fi
FILENAME=$(basename "$1" .asm)

nasm -f elf64 "$1" -o "$FILENAME.o"

if [ $? -ne 0 ]; then
    echo "Assembly failed"
    exit 1
fi

ld "$FILENAME.o" -o "$FILENAME"

if [ $? -ne 0 ]; then
    echo "Linking failed"
    exit 1
fi