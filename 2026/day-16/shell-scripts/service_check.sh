#!/bin/bash

read -p "Do you want to check the status? (y/n): "  yn

if [ "$yn" == y ]; then

	read -p "Enter service name to check status (e.g., 'nginx', 'sshd', etc..): " service
	echo "checking "$service" status..."
	systemctl status "$service"

else
	echo "Skipped..."
fi




