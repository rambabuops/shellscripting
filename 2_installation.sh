#!/usr/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run this script with root user access"
    exit 1

fi

echo "installing NGINX"

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "installation nginx ...failed"
    exit 1
else
    echo "installing nginx ... success"
    
fi

#by default shell will not execute , only executed when called
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ...failed"
        exit 1
    else
        echo "$2 ... success"
    
    fi

}

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install nginx -y
VALIDATE $? "installing nginx"

dnf install nodejs -y
VALIDATE $? "installing nodejs"

