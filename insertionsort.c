#include <stdio.h>
#include <stdlib.h>
void insertionsort(int a[],int m){
int i,v,j;
for(i=0;i<m;i++){
v=a[i];
j=i-1;
while(j>=0 && a[j]>v){
a[j+1]=a[j];
j--;
a[j+1]=v;
}
}
}
int main()
{
    int m,a[30],i;
    printf("Enter the size of array");
    scanf("%d",&m);
    printf("Enter the array elements");
    for(i=0;i<m;i++){
    scanf("%d",&a[i]);
    }
    printf("Before sorting");
    for(i=0;i<m;i++){
    printf("%d\t",a[i]);
    }
    insertionsort(a,m);
    printf("\n");
    printf("after sorting");
    for(i=0;i<m;i++){
    printf("%d\t",a[i]);
    }
    return 0;
}

