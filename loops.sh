#!/usr/bash

USERID=$(id -u)
LOGS_FLODER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

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
    echo "installing nginx ... success" | tee -a $LOG_FILE
    
fi

#by default shell will not execute , only executed when called
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ...failed" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 ... success" | tee -a $LOG_FILE
    
    fi

}

for package in $@
do
    list installed $package &>>$LOG_FILE
    if [$? -ne 0];then
        echo "$package not installed, installing now"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package installation"
    else
        echo "$package already installed, skipping"
done

