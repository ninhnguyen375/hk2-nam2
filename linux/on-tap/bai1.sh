#!/bin/bash

# make 20 random number array
for((i=0;i<20;i++));
do
  # define a random number to temp
  temp=$(( RANDOM % 30 + 10 ))
  
  # make new random number if an array contains this $temp
  while [[ "${arr[*]}" =~ "${temp}" ]]
  do
    temp=$(( RANDOM % 30 + 10 ))
  done
  
  # save this random number to array
  arr[i]=$temp
done

# echo to file
echo ${arr[*]:0:10} > ./bai1
echo ${arr[*]:10:20} >> ./bai1
