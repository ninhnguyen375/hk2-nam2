#!/bin/bash


# variable on terminal
n=$1
fileRandom=$2
fileResult=$3

# 1.
function taoMangSoNgauNhien()
{  
  for((i=0;i<n;i++));
  do
    arr[$i]=$(( $RANDOM % 99 + 1 ))
  done
}


#2
function xuatMang()
{
  # init file
  echo -n "" > $fileRandom

  for((j=0;j<n;j++));
  do
    if [[ $j%10 -eq 0 && $j -ne 0 ]] 
    then
      echo "" >> $fileRandom
    fi
    echo -n "${arr[$j]} " >> $fileRandom
  done
}

# 3
function ktSCP()
{
  local num=$(echo "scale=2; sqrt($1)*sqrt($1)" | bc)
  local num2=$(echo "$1 * 1.00" | bc)
  if [[ $num == $num2 ]] 
  then
    return 1
  else
    return 0
  fi
}

function lietKeSCP()
{
  arr2=(`cat $fileRandom`)
  for num in ${arr2[*]}
  do
    ktSCP $num
    if [[ $? -eq 1 ]] 
    then
      echo $num
    fi
  done  
}

# 4
function xuatSCP()
{
  # init file
  echo -n "" > $fileResult

  echo `lietKeSCP` >> $fileResult
}

while [[ true ]] 
do
  echo "1.Phat sinh so vao mang."
  echo "2.Chep du lieu vao file."
  echo "3.Liet ke so chinh phuong."
  echo "4.Luu lai ket qua."
  echo "5.Thoat."
  read -p "Choose : " choose

  case $choose in
    1) taoMangSoNgauNhien
    ;;

    2) xuatMang
    ;;

    3) lietKeSCP
    ;;

    4) xuatSCP
    ;;

    5) exit
    ;;

    *) echo "Ko hop le."
    ;;
  esac

  read -p "Enter de tiep tuc." tmp
  
done
