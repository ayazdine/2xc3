#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <binary file>"
    exit 1
fi

while read -a bins; do
    for bin in "${bins[@]}"; do
        echo "obase=10; ibase=2; $bin" | bc | awk '{if ($0 >= 32 && $0 <= 126) printf "%c", $0}';
    done
done < "$1"; echo
