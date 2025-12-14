#!/bin/bash

#-gt ---> greater then
#-lt ---> less then
#-eq----> equal
#-ne----> not equal

NUMBER=$1

if [ $NUMBER -lt 10 ]
then
    echo "Given number $NUMBER is less than 10
else
    echo "Given number $NUMBER is not less than 10
fi
