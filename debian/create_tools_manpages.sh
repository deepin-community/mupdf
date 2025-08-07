#!/bin/bash

input_file="$1"
output_dir="output_files"
mkdir -p "$output_dir"
counter=0
filename=""

while IFS= read -r line; do
    if [[ $line =~ ^:title:\` ]]; then
        if [[ -n "$filename" ]]; then
            echo "$chapter_content" > "$output_dir/$filename"
        fi
        
        title=$(echo "$line" | sed 's/^:title:`\(.*\)`/\1/')
        filename=$(echo "$title" | tr ' ' '_' | tr '[:upper:]' '[:lower:]').rst
        
        chapter_content="$line"$'\n'
        counter=$((counter + 1))
    else
        chapter_content="$chapter_content$line"$'\n'
    fi
done < "$input_file"

if [[ -n "$filename" ]]; then
    echo "$chapter_content" > "$output_dir/$filename"
fi

echo "done!"

