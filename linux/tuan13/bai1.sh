#!/bin/bash

ktSCP() {
  local num=`echo  "scale=2; sqrt($1) * sqrt($1)" | bc`
  local num2=`echo "$1 * 1.00" | bc`
  if [[ "$num" == "$num2" ]]
  then
    return 1
  else
    return 0
  fi
}

for so in $*
do
  ktSCP $so
  if [[ $? -eq 1 ]]
  then
    echo $so
  fi
done
