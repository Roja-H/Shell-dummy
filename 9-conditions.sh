#!/bin/bash

#-gt ---> greater then
#-lt ---> less then
#-eq----> equal
#-ne----> not equal

NUMBER=$1

if [$NUMBER -lt 10]
then
    echo "Given NUMBER $NUMBER is less then 10
else
    echo "Given NUMBER $NUMBER is greater then 10
fi
