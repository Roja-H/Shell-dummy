#!/bin/bash

#in array we can store multiple values

MOVIES=("KGF" "TOXIC" "RAMAYANA")  #here array size is 3 and starts from 0,1,2
echo "First movie name : ${MOVIES[0]}"
echo "All movies : ${MOVIES[*]}"
