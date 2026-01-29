#!/usr/bash

USERID=$(id -u)
LOGS_FLODER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"
if [ $USERID -ne 0 ]; then
    echo -e "$R please run this script with root user access $N" | tee -a $LOG_FILE
    exit 1

fi

echo "installing NGINX"

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo -e "installation nginx ...$R failed $Y"
    exit 1
else
    echo -e "installing nginx ... $G success $Y" | tee -a $LOG_FILE
    
fi

#by default shell will not execute , only executed when called
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ...$R failed $Y" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 ... $G success $Y" | tee -a $LOG_FILE
    
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

