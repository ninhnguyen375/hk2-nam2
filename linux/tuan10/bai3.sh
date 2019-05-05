read -p "Enter String : " string
echo "$string" | tr -s '[:lower:]' '[:upper:]'