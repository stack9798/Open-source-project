#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Usage: ./ex3-8.sh [name] [phone_number] [append/overwrite]"
	exit 1
fi

name="$1"
phone="$2"
mode="$3"

if [ "$mode" == "append" ]; then
	echo "$name $phone" >> DB.txt
	echo "Record appended to DB.txt."
elif [ "$mode" == "overwrite" ]; then
	echo "$nmae $phone" > DB.txt
	echo "DB.txt has been overwritten with the new record."
else
	echo "Invalid mode. Use 'append' or 'overwrite'."
	exit 1
fi
