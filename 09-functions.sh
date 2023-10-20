#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE(){

if [ $1 -ne 0 ]
 then
    echo "$2 .... FAILURE"
    exit 1
else 
    echo "$2 ..... SUCCESS"
fi

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: run the code with root access"
    exit 1
fi


yum install mysql -y &>>$LOGFILE

VALIDATE $? "INSTALLING MYSQL"
#VALIDATE ARGUMENT 1 AS $1 ARGUMENT 2  $2

yum install postfix -y &>>$LOGFILE

VALIDATE $? "INSTALLING POSTFIX"
#VALIDATE ARGUMENT 1 AS $1   ARGUMENT 2  $2