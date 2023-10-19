#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: run the code with root access"
fi


 yum install mysql -y