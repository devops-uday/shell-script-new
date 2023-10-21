#!/bin/bash

APP_LOGS_DIR=/home/centos/apps-logs

USERID=$(id DATE=$(date +%F)
LOGSDIR=/home/centos/shellscripts-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log


FILES_TO_DELETE=$( find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE"
