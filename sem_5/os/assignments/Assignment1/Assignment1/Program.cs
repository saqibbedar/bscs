using System;
using System.Threading;

namespace SumUsingThreads
{
    class Program
    {
        static void Main(string[] args)
        {
            // -----------------------------
            // 1) Generate Random Array of 1 lac (100,000) ints
            // -----------------------------
            const int total = 100_000;
            const int parts = 10;
            const int chunk = total / parts;

            var data = new int[total];
            var rng = new Random();
            for (int i = 0; i < data.Length; i++)
            {
                data[i] = rng.Next(); // non-negative random int
            }

            // -----------------------------
            // 2) Create 10 arrays with ~10k ints each
            // -----------------------------
            var arr1 = new int[chunk];
            var arr2 = new int[chunk];
            var arr3 = new int[chunk];
            var arr4 = new int[chunk];
            var arr5 = new int[chunk];
            var arr6 = new int[chunk];
            var arr7 = new int[chunk];
            var arr8 = new int[chunk];
            var arr9 = new int[chunk];
            var arr10 = new int[chunk];

            Array.Copy(data, 0 * chunk, arr1, 0, chunk);
            Array.Copy(data, 1 * chunk, arr2, 0, chunk);
            Array.Copy(data, 2 * chunk, arr3, 0, chunk);
            Array.Copy(data, 3 * chunk, arr4, 0, chunk);
            Array.Copy(data, 4 * chunk, arr5, 0, chunk);
            Array.Copy(data, 5 * chunk, arr6, 0, chunk);
            Array.Copy(data, 6 * chunk, arr7, 0, chunk);
            Array.Copy(data, 7 * chunk, arr8, 0, chunk);
            Array.Copy(data, 8 * chunk, arr9, 0, chunk);
            Array.Copy(data, 9 * chunk, arr10, 0, chunk);

            // Partial sums (long to prevent overflow)
            long s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0, s6 = 0, s7 = 0, s8 = 0, s9 = 0, s10 = 0;

            // -----------------------------
            // 3) Create 10 separate threads (explicitly)
            // -----------------------------
            var t1 = new Thread(() =>
            {
                // 4) Run thread to perform sum (Array.ForEach to mimic arr.forEach(a => ...))
                Array.ForEach(arr1, a => s1 += a);
            })
            { Name = "T1" };

            var t2 = new Thread(() =>
            {
                Array.ForEach(arr2, a => s2 += a);
            })
            { Name = "T2" };

            var t3 = new Thread(() =>
            {
                Array.ForEach(arr3, a => s3 += a);
            })
            { Name = "T3" };

            var t4 = new Thread(() =>
            {
                Array.ForEach(arr4, a => s4 += a);
            })
            { Name = "T4" };

            var t5 = new Thread(() =>
            {
                Array.ForEach(arr5, a => s5 += a);
            })
            { Name = "T5" };

            var t6 = new Thread(() =>
            {
                Array.ForEach(arr6, a => s6 += a);
            })
            { Name = "T6" };

            var t7 = new Thread(() =>
            {
                Array.ForEach(arr7, a => s7 += a);
            })
            { Name = "T7" };

            var t8 = new Thread(() =>
            {
                Array.ForEach(arr8, a => s8 += a);
            })
            { Name = "T8" };

            var t9 = new Thread(() =>
            {
                Array.ForEach(arr9, a => s9 += a);
            })
            { Name = "T9" };

            var t10 = new Thread(() =>
            {
                Array.ForEach(arr10, a => s10 += a);
            })
            { Name = "T10" };

            // Start explicitly (no loops)
            t1.Start(); t2.Start(); t3.Start(); t4.Start(); t5.Start();
            t6.Start(); t7.Start(); t8.Start(); t9.Start(); t10.Start();

            // Wait explicitly (no loops)
            t1.Join(); t2.Join(); t3.Join(); t4.Join(); t5.Join();
            t6.Join(); t7.Join(); t8.Join(); t9.Join(); t10.Join();

            // -----------------------------
            // 5) Aggregate the sum of array results
            // -----------------------------
            long totalSum = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8 + s9 + s10;

            Console.WriteLine("---- Multithreaded Sum (Explicit Threads) ----");
            Console.WriteLine($"Total numbers : {total}");
            Console.WriteLine($"Arrays        : {parts} x {chunk}");
            Console.WriteLine($"Sum(T1..T10)  : {totalSum}");
        }
    }
}
