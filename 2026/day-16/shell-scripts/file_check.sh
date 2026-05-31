#!/bin/bash

read -p "Entere the file name to check if it's exist or not: " filename

if [[ -f "$filename" ]]; then
    echo "The file '$filename' exists!"
else
    echo "The file '$filename' does not exist."
fi



