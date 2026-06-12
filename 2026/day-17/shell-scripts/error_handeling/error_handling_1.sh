#!/bin/bash

<<usage
Create a file and if not created then print a line and create another file with a message.
usage

# Corrected the syntax inside the curly braces
touch new-file.txt || { echo " the file was not created "; echo "demo file" > new-file-1.txt; }

echo "done"
