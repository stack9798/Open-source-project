#!/bin/bash
if [ -z "$1" ]; then
	echo "Usage: ./ex3-7.sh folder_name"
	exit 1
fi

folder_name="$1"
mkdir -p "$folder_name"
cd "$folder_name" || exit

for i in {0..4}; do
	file="file$i.txt"
	touch "$file"
done

for i in {0..4}; do
	file="file$i.txt"
	folder="file$i"
	mkdir -p "$folder"
	ln -s "../$file" "$folder/$file"
done

echo "Files and links created successfully in $folder_name."
