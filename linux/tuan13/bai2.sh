#!/bin/bash
# something
themSV() {
  read -p "Nhap ten SV:" ten
  read -p "Nhap NTNS SV:" NTNS
  read -p "Nhap Khoa SV:" khoa
  read -p "Nhap Lop SV:" lop
  
  arr=(`tail -1 sv.txt`)
  MSSV=`echo "${arr[0]}" | bc -l`
  MSSV=$(( $MSSV + 1 ))
  
  if [ ${MSSV} -lt 10 ]
  then
    MSSV="000${MSSV}"
  elif [ ${MSSV} -lt 100 ]
  then
    MSSV="00${MSSV}"
  elif [ ${MSSV} -lt 1000 ]
  then
    MSSV="0${MSSV}"
  fi
  
  echo "$MSSV $ten $NTNS $khoa $lop" >> sv.txt
}

xuatTheoKhoa() {
  read -p "Nhap Khoa:" khoa
  grep $khoa sv.txt
}

while [ true ]
do
  echo "1.Them SV"
  echo "2.Xuat SV"
  echo "3.Xuat SV Theo Khoa"
  echo "0.Thoat"
  read -p "Choose:" choose
  case $choose in
    1) themSV
    ;;
    2) cat sv.txt
    ;;
    3) xuatTheoKhoa
    ;;
    *) exit
    ;;
  esac
  
done
