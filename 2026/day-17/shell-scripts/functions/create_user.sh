#!/bin/bash

<<usage
- take user name as input
- cheks if user already present or not
- take password as input
- create the user
usage

create_user(){
read -p " enter the username : " username
read -p " enter the password : " password

if id "$username" &> /dev/null; then
	echo "The user $username already exists. "
	exit 1
else
	echo "The user $username does not exist."
fi

sudo useradd -m $username -p $password

echo "user $username added successfully..."
}

