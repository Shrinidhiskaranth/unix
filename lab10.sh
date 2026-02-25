echo "enter the first file "
read file1
echo "enter the second file"
read file2
if [ -e $file1 -a -e $file2 ];then
p1=`ls -l $file1 | cut -c 2-10`
p2=`ls -l $file2 | cut -c 2-10`
if [ $p1 = $p2 ]; then 
echo "file $file1 and $file2 has same permission :$p1"
else 
echo "$file1 has permission : $p1"
echo "$file2 has permission : $p2"
fi
else
echo "Invalid file name"
fi

