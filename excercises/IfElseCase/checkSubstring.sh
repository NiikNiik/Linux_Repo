#!/bin/bash

echo "This file checks to see if a string contains a substring"

read -p "Enter the full string: " str
read -p "Enter a potential substring: " substr

if [[ $str == *"$substr"* ]]; then
	echo "substring found!"
else
	echo "substring not found"
fi
