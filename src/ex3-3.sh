#!/bin/bash
if [ $# -ne 2 ]; then
	echo "Usage: ./ex3-3.sh weight(kg) height(cm)"
	exit 1
fi

weight=$1
height=$2

bmi=$(echo "scale=2; $weight / (($height / 100) * ($height / 100))" | bc)

if (( $(echo "$bmi < 18.5" | bc -l) )); then
	echo "Underweight"
elif (( $(echo "$bmi >= 18.5 && $bmi < 23" |bc -l) )); then
	echo "Normal weight"
else
	echo "Overweight"
fi
