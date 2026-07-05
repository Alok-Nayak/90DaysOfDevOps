#!/bin/bash

<<comment
car=$1

case $car in
	"BMW" )
		echo "This is BMW" ;;
	"Mercedese" )
		echo "This is mercedese" ;;
	"Honda" )
		echo "This is Honda" ;;
	"BYD" )
		echo "This is BYD" ;;
	* )
		echo "This is not as car or not a car listed" ;;	
esac
comment

case "$1" in
    start)   echo "Starting service..." ;;
    stop)    echo "Stopping service..." ;;
    restart) echo "Restarting..." ;;
    *)       echo "Usage: $0 {start|stop|restart}" ;;
esac
