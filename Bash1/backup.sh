#!/bin/bash

echo "# This script is used to quickly backup your files	#"
echo "# and directories! :D					#"
echo "#							#"
echo "# Please use format "./backup.sh source/file backup/file "#"
echo "#							#"
echo "#							#"
echo "							 "

dest=$backupDir
target=$sourceDir

file=$1
file2=$2

DIFF=$(diff "$1" "$2")

#Will not copy over contents of files
if [ ! -d "$dest" ]; then
    #Creates a new backup directory if one does not exist
    echo "Creating backup directory"
    mkdir backupDir

    if [ -e "$1" ]; 
    then
	#Checking if file exists 
	echo "Sweet, the file exists in source directory"
    else 
	#If the file does not exist
	"File does not exist, please select new file"
	cp -R $1 $dest
    fi

    if [ "$DIFF" != "" ];
    then
	#Comparing two files if they are not the same.  
	echo "File is not recent copy, copying to dir"
	cp -R $1 $dest
    else
	echo "File is up to date :)"
    fi
fi

exit
