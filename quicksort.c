#include <stdio.h>
#include <stdlib.h>

int partion(int a[], int l, int r);

void quicksort(int a[], int l, int r) {
    if (l < r) {
        int s = partion(a, l, r);
        quicksort(a, l, s - 1);
        quicksort(a, s + 1, r);
    }
}

int partion(int a[], int l, int r) {
    int p = a[l];
    int i = l;
    int j = r;
    int temp;

    while (i < j) {
        while (a[i] <= p && i < r)
            i++;

        while (a[j] > p)
            j--;

        if (i < j) {
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    }

    temp = a[l];
    a[l] = a[j];
    a[j] = temp;

    return j;
}

int main() {
    int a[10], i, n;

    printf("Enter the n: ");
    scanf("%d", &n);

    printf("Enter the elements:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    printf("Before sorting:\n");
    for (i = 0; i < n; i++) {
        printf("%d\t", a[i]);
    }

    quicksort(a, 0, n - 1);

    printf("\nAfter sorting:\n");
    for (i = 0; i < n; i++) {
        printf("%d\t", a[i]);
    }

    return 0;
}
