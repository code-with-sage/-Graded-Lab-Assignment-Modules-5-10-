#!/bin/bash

# Check for exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument is required."
    exit 1
fi

INPUT="$1"

# Check if path exists
if [ ! -e "$INPUT" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If input is a file
if [ -f "$INPUT" ]; then
    echo "File Analysis:"
    echo "Lines: $(wc -l < "$INPUT")"
    echo "Words: $(wc -w < "$INPUT")"
    echo "Characters: $(wc -c < "$INPUT")"

# If input is a directory
elif [ -d "$INPUT" ]; then
    echo "Directory Analysis:"
    echo "Total files: $(find "$INPUT" -type f | wc -l)"
    echo "Text files (.txt): $(find "$INPUT" -type f -name "*.txt" | wc -l)"

else
    echo "Error: Invalid input."
fi
