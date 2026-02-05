#!/bin/bash

if [ ! -f input.txt ]; then
    echo "Error: input.txt not found."
    exit 1
fi

# Convert text to one word per line
words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z')

# Longest word
longest=$(echo "$words" | sort -r | head -n 1)

# Shortest word
shortest=$(echo "$words" | sort | head -n 1)

# Average word length
avg=$(echo "$words" | awk '{ total += length($0); count++ } END { if (count>0) print total/count }')

# Total unique words
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total number of unique words: $unique"
