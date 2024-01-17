#include <iostream>
#include <cmath>
#include <chrono>
#include <omp.h>

int main() {
    const int N = 999999;
    double sum = 0;

    auto start = std::chrono::steady_clock::now();


#pragma omp parallel for reduction(+:sum)
    for (int i = 1; i <= N; ++i) {
        double ai = std::cos(i) * std::sin(i) + 0.77 * std::pow(std::cos(2 * i + 50), 2);
        sum += ai;
    }

    auto end = std::chrono::steady_clock::now();

    std::cout << "Sum: " << sum << std::endl;
    std::cout << "Time: " << std::chrono::duration_cast<std::chrono::microseconds>(end - start).count() << " microseconds" << std::endl;

    return 0;
}
