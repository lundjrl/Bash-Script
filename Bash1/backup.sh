#!/bin/bash

target=$backupDir
target2=$sourceDir

file=$1
file2=$2
while
do
if [ -e $1 ] then
	echo "Sweet, the file exists in source""
	else 
		"File does not exist, copying"
		cp $1 $backupDir
fi

done

exitp
