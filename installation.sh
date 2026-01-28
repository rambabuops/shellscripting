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

