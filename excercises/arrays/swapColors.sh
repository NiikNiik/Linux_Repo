#!/bin/bash

source ./colors.sh

# Display colors before swapping
echo "Before swapping positions $pos1 and $pos2:"
echo "${colors[*]}"

# Ask user for positions to swap
echo -n "Enter the first position to swap (0-5): "
read pos1
echo -n "Enter the second position to swap (0-5): "
read pos2

# Swap the values
temp=${colors[$pos2]}
colors[$pos2]=${colors[$pos1]}
colors[$pos1]=$temp

# Display colors after swapping
echo "After swapping positions $pos1 and $pos2:"
echo "${colors[*]}"
