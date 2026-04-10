#include <stdio.h>

// Function to find the maximum of two integers
int max(int a, int b) {
    return (a > b) ? a : b;
}

int main() {
    int n, W, i, j;

    // --- 1. ENHANCED INPUT SECTION ---
    printf("Enter the number of objects: ");
    if (scanf("%d", &n) != 1) return 1;

    int val[n], wt[n];
    for (i = 0; i < n; i++) {
        printf("\n--- Object %d ---\n", i + 1);
        printf("Enter Value: ");
        scanf("%d", &val[i]);
        printf("Enter Weight: ");
        scanf("%d", &wt[i]);
    }

    printf("\nEnter the maximum capacity of the knapsack: ");
    scanf("%d", &W);

    // Create the DP Table (The Graph)
    int v[n + 1][W + 1];

    // --- 2. Build the Knapsack Graph (Table) ---
    for (i = 0; i <= n; i++) {
        for (j = 0; j <= W; j++) {
            if (i == 0 || j == 0) {
                v[i][j] = 0;
            } else if (wt[i - 1] <= j) {
                v[i][j] = max(v[i - 1][j], val[i - 1] + v[i - 1][j - wt[i - 1]]);
            } else {
                v[i][j] = v[i - 1][j];
            }
        }
    }

    // --- 3. Print the Knapsack Graph (Matrix) ---
    printf("\n--- Knapsack DP Table (Graph) ---\n");
    for (i = 0; i <= n; i++) {
        for (j = 0; j <= W; j++) {
            printf("%d\t", v[i][j]);
        }
        printf("\n");
    }

    // --- 4. Print Optimal Solution and Selected Objects ---
    printf("\nOptimal Solution (Max Value): %d\n", v[n][W]);
    printf("Selected Objects:\n");

    j = W;
    for (i = n; i > 0; i--) {
        if (v[i][j] != v[i - 1][j]) {
            printf("Object %d (Value: %d, Weight: %d)\n", i, val[i - 1], wt[i - 1]);
            j = j - wt[i - 1];
        }
    }

    return 0;
}
