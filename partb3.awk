BEGIN{
FS=" "
}
{
split($0,arr," ")
for(i in arr)
{
printf "%s ",arr[i]
sum=sum+arr[i]
} 
printf "%d\n",sum
}

