#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATE(){

if [ $1 -ne 0 ]
 then
    echo -e "$2 ....$R FAILURE $N"
    exit 1
else 
    echo -e "$2 .....$G SUCCESS $N"
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

yum install posttfix -y &>>$LOGFILE

VALIDATE $? "INSTALLING POSTFIX"
#VALIDATE ARGUMENT 1 AS $1   ARGUMENT 2  $2