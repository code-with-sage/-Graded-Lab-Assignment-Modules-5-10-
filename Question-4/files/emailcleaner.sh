#!/bin/bash

if [ ! -f emails.txt ]; then
    echo "Error: emails.txt not found."
    exit 1
fi

# Extract valid email addresses
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid.txt

# Remove duplicate valid emails
sort valid.txt | uniq > temp.txt
mv temp.txt valid.txt

# Extract invalid email addresses
grep -v -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt
