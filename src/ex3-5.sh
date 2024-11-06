#!/bin/bash
echo "Starting the program."

function run_ls() {
	echo "Executing 'ls' with options: $@"
	ls "$@"
}

run_ls "$@"

echo "Ending the program."
