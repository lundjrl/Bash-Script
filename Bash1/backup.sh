#!/bin/bash

dest=$backupDir
target2=$sourceDir

file=$1
file2=$2

DIFF=$(diff "$1" "$2")

if [ -e "$1" ] 
then
	echo "Sweet, the file exists in source"
else 
	"File does not exist, copying"
	cp -v $1 $backupDir
fi


if [ "$DIFF" != "" ]
then 
	echo "File is not recent copy, copying to dir"
	cp -v $1 $backupDir
fi

exit
