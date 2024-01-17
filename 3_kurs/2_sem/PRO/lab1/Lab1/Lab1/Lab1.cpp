#include <iostream>
#include <chrono>
#include <cmath>
using namespace std;
using namespace std::chrono;

int main() {
    auto start = high_resolution_clock::now();
    double sum = 0;
    for (int i = 1; i <= 10000; i++) {
        double ai = cos(i) * sin(i) + 0.77 * pow(cos(2 * i + 50), 2);
        sum += ai;
    }
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    cout << "The sum of the first N terms in the progression is: " << sum << endl;
    cout << "Time taken: " << duration.count() << " microseconds" << endl;
    return 0;
}