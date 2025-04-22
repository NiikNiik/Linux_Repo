#! /bin/bash

#import arrarys from colors.sh
source ./colors.sh 

echo "Pick a color (0 through 5): "

read index

echo "The color you chose was ${colors[$index]}"
