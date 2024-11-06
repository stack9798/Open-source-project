#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: ./ex3-6.sh [folder_name]"
    exit 1
fi

folder_name="$1"


if [ ! -d "$folder_name" ]; then
    echo "Folder '$folder_name' does not exist. Creating folder."
    mkdir "$folder_name"
else
    echo "Folder '$folder_name' already exists."
fi


cd "$folder_name" || exit
for i in {0..4}; do
    touch "file$i.txt"
done
echo "Created 5 files in '$folder_name'."


tar -cvf "${folder_name}.tar" file*.txt
echo "Compressed files into '${folder_name}.tar'."


extract_folder="${folder_name}_extracted"
mkdir -p "../$extract_folder"
tar -xvf "${folder_name}.tar" -C "../$extract_folder"
echo "Extracted '${folder_name}.tar' into '../$extract_folder'."
