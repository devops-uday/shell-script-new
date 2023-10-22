#!/bin/bash

#colors
#validations
#logs redirections

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpf|Filesystem')
DISK_USAGE_THRESHOLD=1

# 'IFS= 'means INTERNAL FIELD SEPARATOR is 'space'
while IFS= read line
do 
    echo "OUTPUT: $line"
done <<< $DISK_USAGE

