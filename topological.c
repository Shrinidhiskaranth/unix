#include <stdio.h>
#include <stdlib.h>


int main()
{
int indeg[30],flag[30];
int a[5][5]={{0,1,0,1,0},{0,0,1,1,0},{0,0,0,0,0},{0,0,1,0,1},{0,0,0,0,0}};
int i,count=0,j,k;
int n=5;
for(i=0;i<n;i++){
indeg[i]=0;
flag[i]=0;
}
for(i=0;i<n;i++){
 for(j=0;j<n;j++){
 indeg[i]=indeg[i]+a[j][i];}}
 printf("Topological sorting ");
while(count<n){
for(k=0;k<n;k++){
if(indeg[k]==0 && flag[k]==0){
 printf("%d",k+1);
 flag[k]=1;
}
for(i=0;i<n;i++){
if(a[k][i]==1){
a[k][i]=0;
indeg[i]--;
}}
}
count++;
}
    return 0;
}
