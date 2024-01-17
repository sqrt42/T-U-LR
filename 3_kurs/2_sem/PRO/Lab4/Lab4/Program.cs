using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Lab4
{
    class Program
    {

        static void Sequential()
        {
               const int n = 999999;
               double sum = 0.0;
               Stopwatch stopwatch = new Stopwatch();

               stopwatch.Start(); 

               for (int i = 0; i < n; i++)
               {
                   double a = Math.Cos(i) * Math.Sin(i) + 0.77 * Math.Pow(Math.Cos(2 * i + 50), 2);
                   sum += a;
               }

               stopwatch.Stop(); 
               Console.WriteLine($"Time elapsed: {stopwatch.ElapsedMilliseconds} ms");
               Console.WriteLine($"Sum: {sum}");
        }

    static void Main()
        {
            int n = 999999; // number of elements to count
            double sum = 0.0; // sum

            // creating the task array
            var tasks = new Task<double>[Environment.ProcessorCount];

            // tracking elapsed time
            var stopwatch = new Stopwatch();

            stopwatch.Start(); 

            for (int i = 0; i < tasks.Length; i++)
            {
                // a task to count the sum
                tasks[i] = Task.Factory.StartNew(() =>
                {
                    double localSum = 0.0;
                    for (int j = i; j < n; j += tasks.Length)
                    {
                        double a = Math.Cos(j) * Math.Sin(j) + 0.77 * Math.Pow(Math.Cos(2 * j + 50), 2);
                        localSum += a;
                    }
                    return localSum;
                });
            }

            // wait for all tasks to finish & count the sum 
            Task.WaitAll(tasks);
            for (int i = 0; i < tasks.Length; i++)
            {
                sum += tasks[i].Result;
            }

            stopwatch.Stop(); // stop tracking time

            Console.WriteLine($"Sum: {sum}");
            Console.WriteLine($"Time elapsed: {stopwatch.ElapsedMilliseconds} ms");
            Console.WriteLine("Sequential:");
            Sequential();
        }
    }
}
