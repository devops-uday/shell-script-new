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
message=

# 'IFS= 'means INTERNAL FIELD SEPARATOR is 'space'
while IFS= read line
do 
    #this command will give you the usage in number format for comapsrison
    usage=$(echo $line | awk '{print$6}' | cut -d % -f1)
    #this command will give the partition
    partition=$(echo $line | awk '{print$1}')
    #now we need to check whether it is more than threshold or not
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then  
        message+="HIGH DISK USAGE IN $partition : $usage"
    fi
done <<< $DISK_USAGE

echo "message : $message"


