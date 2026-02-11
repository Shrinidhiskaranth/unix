if [ $# -eq 0 ]
then
echo "no argument provided"
exit 1
fi
echo "arguments in same order:$@"
echo "argument in reverse order"
for((i=$#;i>0;i--))
do
eval echo ${!i}
done
