#!/bin/bash

read -p "Enter a number to tell if greater or less than 0 (zero): " number

if [ $number -gt 0 ]; then
	echo "Your number '$number' is greater than 0"
else
	echo "Your number '$number' is less than 0"
fi
