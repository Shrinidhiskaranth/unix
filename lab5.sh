read -p "enter the string str1" str1
if [ -z "$str1" ]
then 
echo "Invalid string "
else
len=$(expr "$str1" : '.*')
echo "the length of the string :$len"
if [ $len -ge 6 ]
then
first=$(expr "$str1" : '\(...\).*')
echo "the first three character is $first"
last=$(expr "$str1" : '.*\(...\)')
echo "first three characters $last"
else 
echo "string length  is less than 6"
fi
fi
