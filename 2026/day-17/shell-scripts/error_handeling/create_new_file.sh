#!/bin/bash

file-create(){
touch new-file.txt || { echo "file nanhi bani ya already hai, ya kuch issue hua hai" ; echo "Check karo kya hua hai"; }
}

delete(){
rm -rf new-file.txt  || { echo "delete nanhi hua"; }
}
echo "Creating file"
file-create
echo "File Created"
ls
sleep 2
delete
echo "File Deleted"
ls
