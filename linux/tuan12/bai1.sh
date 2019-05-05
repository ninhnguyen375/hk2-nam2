#!/bin/bash

# init file
echo -n "" > ./data_bai1

for((i=0;i<20;i++));
do
  while [ true ] 
  do
    flag=0
    temp=$(( $RANDOM%30+10 ))
    for((j=0;j<${#arr[*]};j++));
    do
      if [ ${arr[j]} -eq $temp ] 
      then
        flag=1
      fi
    done
    if [ $flag -eq 0 ] 
    then
      arr[$i]=$temp
      break
    fi
    
  done

done

for((i=0;i<20;i++));
do
  echo -n "${arr[$i]} " >> ./data_bai1
  if [ $i -eq "9" ]
  then
    echo "" >> ./data_bai1
  fi
done
