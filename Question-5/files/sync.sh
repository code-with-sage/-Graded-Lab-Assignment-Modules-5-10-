#!/bin/bash

DIRA="dirA"
DIRB="dirB"

if [ ! -d "$DIRA" ] || [ ! -d "$DIRB" ]; then
    echo "Error: One or both directories do not exist."
    exit 1
fi

echo "Files only in $DIRA:"
ls "$DIRA" | while read file
do
    if [ ! -f "$DIRB/$file" ]; then
        echo "$file"
    fi
done

echo
echo "Files only in $DIRB:"
ls "$DIRB" | while read file
do
    if [ ! -f "$DIRA/$file" ]; then
        echo "$file"
    fi
done

echo
echo "Common files comparison:"
ls "$DIRA" | while read file
do
    if [ -f "$DIRB/$file" ]; then
        if cmp -s "$DIRA/$file" "$DIRB/$file"; then
            echo "$file : Contents match"
        else
            echo "$file : Contents differ"
        fi
    fi
done
