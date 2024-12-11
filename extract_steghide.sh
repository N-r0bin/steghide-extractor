#!/bin/bash

default_passwords=("christmastree" "darksky123" "goldenwatch")

if [ -n "$2" ]; then
    IFS=',' read -r -a passwords <<< "$2"
else
    passwords=("${default_passwords[@]}")
fi
target_dir="${1:-.}"

for file in "$target_dir"/*; do
    if [ -f "$file" ]; then  
        echo "File: $file"
        for password in "${passwords[@]}"; do
            echo "Password: $password"
            result=$(steghide extract -sf "$file" -p "$password" -f 2>&1)

            if [ $? -eq 0 ]; then
                echo "Success! File extracted from $file with password $password"
                echo "Steghide Output:"
                echo "$result"
                echo "-----------------"
            else
                echo "No hidden data or wrong password."
            fi
        done
    fi
done

