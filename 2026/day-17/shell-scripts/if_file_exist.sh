#!/bin/bash

if [ $# -eq 0 ]
 then
	 echo " Please pass a file name as an argument "
	 echo " Usage: ./if_file_exixts.sh <file_name> "
	 exit 1
fi

if [ -f $1 ]
then 
	echo "File exixts..."
else
	echo "File doesn't exixt"
fi
