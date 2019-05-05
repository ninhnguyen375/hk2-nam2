#!/bin/bash
function ktSCP()
{
  local num=$(echo "scale=2; sqrt($1) * sqrt($1)" | bc)
  local num2=$(echo "$1 * 1.00" | bc)
  
  if [[ "$num" == "$num2" ]]
  then
    return 1
  else
    return 0
  fi
}

# Get number in file to array
arr=(`cat ./bai1`)
echo ${arr[*]}

for num in ${arr[*]}
do
  ktSCP $num
  if [[ $? -eq 1 ]]
  then
    echo $num
  fi
done
