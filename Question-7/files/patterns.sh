#!/bin/bash

if [ ! -f input.txt ]; then
    echo "Error: input.txt not found."
    exit 1
fi

# Convert text to one word per line and normalize case
words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z')

# Words with only vowels
echo "$words" | grep -E '^[aeiou]+$' > vowels.txt

# Words with only consonants
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz]+$' > consonants.txt

# Words starting with a consonant and containing both vowels and consonants
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz]' | grep -E '[aeiou]' > mixed.txt
