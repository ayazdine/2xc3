#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <binary file>"
    exit 1
fi

while IFS= read -r line || [[ -n "$line" ]]; do
    # Break the line into array elements separated by spaces
    IFS=' ' read -ra bins <<< "$line"
    for bin in "${bins[@]}"; do
        # Convert each binary number to ASCII character
        dec_val=$(echo "ibase=2; $bin" | bc)
        char=$(printf "\\$(printf '%03o' $dec_val)")
        echo -n "$char"
    done
done < "$1"
echo
