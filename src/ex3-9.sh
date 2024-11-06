#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: ./ex3-9.sh [name]"
	exit 1
fi

name="$1"
grep -i "$name" DB.txt

if [ $? -ne 0 ]; then
	echo "NO record found for $name."
fi

