#include <stdio.h>
#include <stdlib.h>
int temp;
void heapify(int n,int arr[],int i){
int max=i;
int right=2*i+1;
int left=2*i+2;
if(left<n && arr[left]>arr[max]){
max=left;
}
if(right<n && arr[right]>arr[max]){
max=right;
}
if(max!=i){
temp=arr[i];
arr[i]=arr[max];
arr[max]=temp;
heapify(n,arr,max);
}
}
void heapsort(int arr[],int n){
int i;
for(i=n/2;i>=0;i--){
heapify(n,arr,i);
}
for(i=n-1;i>0;i--){
temp=arr[0];
arr[0]=arr[i];
arr[i]=temp;
heapify(i,arr,0);

}

}
int main()
{
    int arr[10],n;
    printf("Enter the number of elements");
    scanf("%d",&n);
    printf("Enter the array elements");
    for(int i=0;i<n;i++){
    scanf("%d",&arr[i]);
    }
    printf("The elements before heapsort");
for(int i=0;i<n;i++){
printf("%d",arr[i]);
}
    heapsort(arr,n);
    printf("The elements after heapsort");
for(int i=0;i<n;i++){
printf("%d",arr[i]);
}
    return 0;
}
