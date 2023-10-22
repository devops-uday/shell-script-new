#!/bin/bash


#anyone in our team can call this script using arguments
# mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE


TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5


#echo " all args : $@"

FINAL_BODY=$(sed -e 's/TEAM_NAME/DEVOPS TEAM/g' -e 's/ALERT_TYPE/High Disk Usage/g' -e "s/MEASSAGE/$BODY" template.html)

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS