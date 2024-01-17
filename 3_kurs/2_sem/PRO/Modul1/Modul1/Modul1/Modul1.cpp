#include <iostream>
#include <omp.h>

using namespace std;

int main() {
    const int rows = 4, cols = 4;
    int matrix[rows][cols] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
    };

    int max_vals[rows] = { 0 };

#pragma omp parallel for
    for (int i = 0; i < rows; ++i) {
        int max_val = 0;
        for (int j = 0; j < cols; ++j) {
            if (matrix[i][j] > max_val) {
                max_val = matrix[i][j];
            }
        }
        max_vals[i] = max_val;
    }

    cout << "Maximum in a row:" << endl;
    for (int i = 0; i < rows; ++i) {
        cout << "Row " << i << ": " << max_vals[i] << endl;
    }

    return 0;
}