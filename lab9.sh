if [ $# -eq 0 ]
then 
echo "no arguments or file names provided"
exit 1
fi
for file in $@
do 
if [ -e "$file" ] 
then
upper=$(echo "$file" | tr '[:lower:]' '[:upper:]')
if [ -e "$upper" ]
then
echo "cannot rename $file to $upper: file with name $upper already exists"
else
mv $file $upper 
echo "rename $file to $upper"
fi
else 
echo "the $file is converted to uppercase"
fi
done 
