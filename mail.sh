#!/bin/bash


#anyone in our team can call this script using arguments
# mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE


TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5


echo " all args : $@"