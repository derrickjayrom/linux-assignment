#!/bin/bash

# filepath: /home/derrick/linux-assignment/text_analyzer.sh

# Function to analyze a single file
analyze_file() {
    local file=$1

    echo "Analyzing file: $file"
    echo "---------------------------------------"

    # Total number of words, lines, and characters
    local total_words=$(wc -w < "$file")
    local total_lines=$(wc -l < "$file")
    local total_chars=$(wc -m < "$file")

    echo "Total Words: $total_words"
    echo "Total Lines: $total_lines"
    echo "Total Characters: $total_chars"

    # Top 10 most common words (ignoring case)
    echo "Top 10 Most Common Words:"
    tr '[:space:]' '[\n*]' < "$file" | tr '[:upper:]' '[:lower:]' | grep -Eo '[a-z]+' | sort | uniq -c | sort -nr | head -10

    # Longest word in the file
    local longest_word=$(tr '[:space:]' '[\n*]' < "$file" | grep -Eo '[a-zA-Z]+' | awk '{ if (length > max) { max = length; longest = $0 } } END { print longest }')
    echo "Longest Word: $longest_word"

    echo "---------------------------------------"
    echo
}

# Check if at least one file is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <file1> [file2 ... fileN]"
    exit 1
fi

# Loop through all provided files
for file in "$@"; do
    if [ -f "$file" ]; then
        analyze_file "$file"
    else
        echo "Error: File '$file' not found!"
    fi
done