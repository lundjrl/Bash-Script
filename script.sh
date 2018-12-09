#!/bin/bash
file="cis241.zip"
unzip -d file

ls data > temp
while read line
do 
    IFS='_'
    file=$line
    unzip -d file
    username=$2
    filename=$5
    restore IFS
    cut -d -f1 
mv $5 $2
done < temp    
