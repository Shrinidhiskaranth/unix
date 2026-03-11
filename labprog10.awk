BEGIN{
FS="," 
print "filtering sales person who meet the criteria\n"
totalrevenue=0
}
{
if($3>50 && $4>10000){printf("sales_ID=%d, name=%s, revenues=%.2f\n",$1,$2,$4)
totalrevenue=totalrevenue+$4
}
}
END{
print "total revenues genrated=",totalrevenue}
