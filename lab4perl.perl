print "Enter the string";
chop($str1=<STDIN>);
print "Enter the number of time the string needs to be printed";
chop($num=<STDIN>);
$c=$str1 x $num;
print "the result is:$c\n";

