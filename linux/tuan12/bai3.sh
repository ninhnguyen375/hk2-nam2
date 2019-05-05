#!/bin/bash
arr=(`cat ./dayso`)


function sortArr()
{
  for((i=0;i<${#arr[@]};i++));
  do
    for((j=i+1;j<${#arr[@]};j++));
    do
      if [ ${arr[$i]} -gt ${arr[$j]} ]
      then
        temp=${arr[$i]}
        arr[$i]=${arr[$j]}
        arr[$j]=$temp
      fi
    done
  done
}

echo "array : "
echo ${arr[*]}

sortArr

echo "sorted : "
echo ${arr[*]}

read -p "Input new number : " num
arr[${#arr[@]}]=$num

sortArr

echo "new array : "
echo ${arr[*]}

for((i=0;i<${#arr[@]};i++));
do
  arr_b[$i]=`echo "obase=16;${arr[$i]}" | bc`
done

echo ${arr_b[*]}
