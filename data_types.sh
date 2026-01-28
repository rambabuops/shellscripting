#!/bin/bash

NUM1=100
NUM2=Ram

SUM=$(($NUM1+$NUM2))


echo "Sum is : $SUM"

#ARRAY

FRUITS=("apple" "banana" "pomo")

echo "fruits are:${FRUITS[@]}"

echo "first fruit is: ${FRUITS[0]}"
echo "second fruit is: ${FRUITS[1]}"
echo "third fruit is: ${FRUITS[2]}"
