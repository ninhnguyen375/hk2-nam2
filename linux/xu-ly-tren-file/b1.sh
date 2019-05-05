#!bin/bash
numLine=$1
file=$2
read line
char=$3
sed -i "${1}s/${char}/${line}\n/" $2

