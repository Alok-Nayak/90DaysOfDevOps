#!/bin/bash

#set -e

<< usage
creates a folder
usage

mkdir testdir || mkdir -p testdir &>/dev/null

echo " do production work "
