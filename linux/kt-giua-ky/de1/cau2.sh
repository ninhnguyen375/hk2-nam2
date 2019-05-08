#!/bin/bash

function b1()
{
  local hdh
  read -p "Nhap HDH : " hdh
  
  awk -v awk_hdh=$hdh 'BEGIN { FS=" "; } ; $3 == awk_hdh { print $2 }' data
}
function b2()
{
  local ip
  read -p "Nhap IP : " ip
  
  awk -v awk_ip=$ip 'BEGIN { FS=" "; } ; $2 == awk_ip { print $1 }' data
}
function b3()
{
  local ip
  read -p "Nhap IP : " ip
  
  awk -v awk_ip=$ip 'BEGIN { FS=" "; } ; $2 == awk_ip { print $4 }' data
}


while [[ true ]] 
do
  echo "Hay thuc hien lua chon."
  echo "1.Nhap vao HDH de biet dia chi IP."
  echo "2.Nhap vao dia chi IP de biet giao thuc."
  echo "3.Nhap vao dia chi IP de biet gioi gian truy cap."
  echo "4.Thoat."
  read -p "Choose : " choose

  case $choose in
    1) b1
    ;;

    2) b2
    ;;

    3) b3
    ;;

    4) exit
    ;;

    *) echo "Ko hop le."
    ;;
  esac

  read -p "Enter de tiep tuc." tmp
  
done

