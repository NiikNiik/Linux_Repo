#!/bin/bash

read -p "Enter the first number: " dividend
read -p "Enter the second number: " divisor

quotient=$((dividend/divisor))
remainder=$((dividend%divisor))
echo "Quotient: $quotient"
echo "Remainder:$remainder"
