#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: run the code with root access"
    exit 1
fi


 yum install mysql -y

if [ $? -ne 0 ]
 then
    echo "installation of mysql is error"
    exit 1
else 
    echo "installation of mysql is succes"
fi

yum install postfix -y
if [ $? -ne 0 ]
 then
    echo "installation of postfix is error"
    exit 1
else 
    echo "installation of postfix is succes"
fi