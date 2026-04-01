if(scalar @ARGV==0){
print "no argumnet is passed";
exit(1);
}
foreach $m (@ARGV){
$num=$m;
$sum=0;
while($num>0){
$rem=$num % 10;
$sum=$sum+$rem;
$num=$num/10;
}
print "The sum of number(argumnet) $m is:$sum\n";
}
