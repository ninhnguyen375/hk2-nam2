#!bin/bash
num=$1

ktSNT() {
  local x=$1

  if [[ $x < 2 ]]
  then
    return 0
  fi

  x=$(( $x/2 ))

  for ((i = 2; i < x; i++)); do
    if [[ $(( $x%$i )) == 0 ]]
    then
      return 0
    fi
  done

  return 1
}

ktSCP() {
  local x=$1
  n1=`echo "sqrt($x)" | bc`
  n2=$(( $n1 * $n1))
  
  if [[ $n2 == $x ]]
  then
    return 1
  fi
  return 0
}

ktSNT $num
if [[ $? == 1 ]]
then
  echo "$num la SNT"
else
  echo "$num khong la SNT"
fi

ktSCP $num
if [[ $? == 1 ]]
then
  echo "$num la SCP"
else
  echo "$num khong la SCP"
fi
