#!/bin/bash

<< note
./function.sh hello, here hello is the main argument externmally

Inside function call (package_exixt nginx) [here install_package is a function]

note

echo "$1 is the main argument passed to the script"

# function define

is_pkg_installed() {
	echo "$1 is the local argument passed to function"
	if
		command -v $1
	then
		echo "Package $1 exists.."
	else
		echo "Noop $1 package not found..."
	fi
}


#calling the function 
is_pkg_installed nginx #function call


