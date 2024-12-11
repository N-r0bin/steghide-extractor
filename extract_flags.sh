#!/bin/bash

files=("209583_zott820_oven-mitt-impact.wav" "330299_maycuddlepie_siren.mp3" "car.jpeg" "cityscape.jpg" "pizza.jpg" "streetimage.jpg" "verypretty.jpg")

passwords=("christmastree" "darksky123" "goldenwatch" )


for file in "${files[@]}"; do
     echo "File: $file"
    for password in "${passwords[@]}"; do
        echo "Password: $password"
        steghide extract -sf "$file" -p "$password" -f
     
        if [ $? -eq 0 ]; then
           echo "Success! File extracted from $file with password $password"
           echo "Contents:"
           cat FLAG*.txt 2>/dev/null
           echo "-----------------"
        else
           echo "No hidden data or wrong password."
       fi
     done
done
