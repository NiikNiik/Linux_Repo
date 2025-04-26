#!/bin/bash

source ./colors.sh

echo -n "Add a color to list: "

read newColor

colors+=("$newColor")

echo "New color list: ${colors[*]}"


