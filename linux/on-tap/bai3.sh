#!/bin/bash

# a)
arr=(`cat ./bai3`)
echo ${arr[*]}

# b)
function sort()
{
  for((i=0;i<${#arr[*]};i++));
  do
    for((j=i+1;j<${#arr[*]};j++));
    do
      if [[ "${arr[$i]}" -gt "${arr[$j]}" ]]
      then
        t=${arr[$i]}
        arr[$i]=${arr[$j]}
        arr[$j]=$t
      fi
    done
  done
}

sort
echo ${arr[*]}

# c)

# cach 1:
# read -p "New Number : " newNumber
# arr[${#arr[*]}]=$newNumber
# sort
# echo ${arr[*]}

# cach 2:
# read -p "New Number : " newNumber
# for((i=${#arr[*]};i>0;i--));
# do
#   if [[ "${arr[$i-1]}" -gt "$newNumber" ]]
#   then
#     arr[i]=${arr[$i-1]}
#     continue
#   else
#     arr[$i]=$newNumber
#     break
#   fi
# done

# echo ${arr[*]}

# d)
function chuyenDoiCoSo()
{
  local n=$1
  local coSo=$2
  local soDu=0
  
  for((i=0;n>0;i++));
  do
    soDu=$(( $n % $coSo ));
    if [[ $soDu -lt 10 ]]
    then
      s[$i]=$soDu;
    else
      s[$i]=$( printf "\\$( printf '%03o' "$(( $soDu - 10 + 65 ))" )" );
    fi
    n=$(( $n / $coSo ));
  done
  
  # show array s
  str=`echo "${s[*]}" | rev`
  result="${str// /}"
  echo $result
}


for((k=0;k<${#arr[*]};k++));
do
  b[$k]=`chuyenDoiCoSo ${arr[$k]} 16`
done

echo ${b[*]}

