#!/bin/bash

while read line
do
  IFS=':' read -ra arr <<< "$line" # Convert string to array
  echo "${arr[*]}"
done < ./bai4
