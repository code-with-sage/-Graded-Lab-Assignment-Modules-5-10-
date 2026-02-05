#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Please provide a directory path."
    exit 1
fi

DIR="$1"
BACKUP="$DIR/backup"

# Create target and backup directories
mkdir -p "$DIR"
mkdir -p "$BACKUP"

echo "Main script PID: $$"
echo "Starting background move operations..."

for file in "$DIR"/*
do
    if [ -f "$file" ]; then
        mv "$file" "$BACKUP/" &
        echo "Moving $(basename "$file") | PID: $!"
    fi
done

wait
echo "All background processes completed."
