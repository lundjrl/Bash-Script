#/bin/bash

dest=$backupDir
target=$sourceDir

file=$1
file2=$2

silence=false
count=false
help=false

for var in "$@"
do
    if [ "$var" == -s ]; then
        silence=true
    elif [ "$var" == -c ]; then
	      count=true
    elif [ "$var" == --help ]; then
	      help=true
    fi
done

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
	echo "File does not exist, please select new file"
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

if [ "$silence" == true ]; then
    echo "All files in backup.."
    ls backupDir
fi

if [ "$count" == true ]; then
    echo "Amount of files in backup $count"
    ls backup | wc -l
fi

if [ "$help" == true ]; then
    echo "# This script is used to backup your files                     #"
    echo "# and directories! :D                                          #"
    echo "#                                                              #"
    echo "# Please use format "./backup.sh source/file backup/file "     #"
    echo "#                                				                       #"
    echo "# -s Depresses the message reporting a file that is not copied #"
    echo "# 							                                               #"
    echo "# -c Counts and displays the number of files that are copied   #"
    echo "#    and the number of files that are not copied.              #"
    echo "#								                                               #"
    echo "# --help Displays this message pane, of course :)              #"
    echo "#	                                              							 #"
fi
