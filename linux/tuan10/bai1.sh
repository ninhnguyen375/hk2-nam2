#!bin/bash
echo Nhap vao 3 so
read x
read y 
read z
echo so lon nhat : 
if [[ $x > $y && $x > $z ]]; then
  echo $x
elif [[ $y > $z ]]; then
  echo $y
else 
  echo $z
fi
