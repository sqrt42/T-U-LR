#include <iostream>
#include <cmath>
#include <chrono>
#include <thread>
#include <vector>

using namespace std;

const int N = 1000;

void calculate_sum(int start, int end, double& sum)
{
    for (int i = start; i <= end; i++)
    {
        double ai = cos(i) * sin(i) + 0.77 * pow(cos(2 * i + 50), 2);
        sum += ai;
    }
}

int main()
{
    int num_threads = thread::hardware_concurrency();
    double sum = 0;

    auto start_time = chrono::high_resolution_clock::now();

    vector<thread> threads;
    threads.reserve(num_threads);

    int chunk_size = N / num_threads;
    int start = 1;

    for (int i = 0; i < num_threads; i++)
    {
        int end = start + chunk_size - 1;
        threads.emplace_back(calculate_sum, start, end, ref(sum));
        start = end + 1;
    }

    for (auto& thread : threads)
    {
        thread.join();
    }

    auto end_time = chrono::high_resolution_clock::now();
    auto duration_ms = chrono::duration_cast<chrono::milliseconds>(end_time - start_time).count();

    cout << "Sum = " << sum << endl;
    cout << "Time: " << duration_ms << " ms" << endl;

    return 0;
}
