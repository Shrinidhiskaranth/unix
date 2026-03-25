BEGIN{
FS="|"
total_basic=total_da=total_hra=total_gross=count=0
}
($4 == "sales" || $4 == "marketing"){
basic = $6
da=0.25*basic
hra=0.5*basic
gross=basic+da+hra

total_basic+=basic
total_DA+=da
total_hra+=hra
total_gross+=gross
count++
#Print individual employess salary details
printf("%-15s %-10s %-15s %-10s %-10s %-10s %-10s\n",$2,$3,$4,basic,da,hra,gross)
}
END{
if(count>0){
printf("\nTotal Basic salary :%.2f\n",total_basic);
printf("\nTotal da :%.2f\n",total_DA);
printf("\nTotal hra :%.2f\n",total_hra);
printf("\nTotal gross:%.2f\n",total_gross);
printf("\nAverage Basic salary :%.2f\n",total_basic/count);
printf("\nAverage da:%.2f\n",total_DA/count);
printf("\nAverage  hra :%.2f\n",total_hra/count);
printf("\nAverage GROSS :%.2f\n",total_gross/count);
printf count
}else{
print "No records found for Sales or marketing departments";
}
}
