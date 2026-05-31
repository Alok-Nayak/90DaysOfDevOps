#!/bin/bash

read -p "Enter the number to chech positive, negative, or zero: " number

if [[ $number -gt 0 ]]; then
	echo "$number is a positive number."
elif [[ $number -lt 0 ]]; then
	echo "$number is a negetive number."
else
	echo "zeroooooooo"
fi

