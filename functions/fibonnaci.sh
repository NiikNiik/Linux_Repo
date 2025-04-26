#!/bin/bash

read -p "Enter number greater than 3: " num

if [ "$num" -lt 3 ]; then
	echo "Number must be greater than 3"
	exit
fi

#initialize first and second terms
t1=0
t2=1

#initialize the next term (3rd term)
nextTerm=$(($t1 + $t2))

echo -n "$t1, $t2"

fibo () {
	for ((i = 3; i <= $num; ++i)); do
		echo -n ", $nextTerm";
		t1=$t2;
		t2=$nextTerm;
		nextTerm=$(($t1 + $t2));
	done
	echo ""
}

fibo $num
