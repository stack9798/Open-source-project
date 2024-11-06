#!/bin/bash

if [ "$2" = "+" ]; then
	echo $(( $1 + $3 ))
elif [ "$2" = "-" ]; then
	echo $(( $1 - $3 ))
else
	echo "Invalid operation. Use + or -."
fi
