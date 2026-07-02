/*
    10. (Program) A geometric series is defined by the following:

    a + ar + ar^2 + ar^3 + ˙˙˙ + ar^n - 1
    a is the first term.
    r is the “common ratio.”
    n is the number of terms in the series.

    Using this information, write a C++ program that uses a while loop to display each term and determine the sum of a geometric series having a = 1, r = .5, and n = 10. Make sure your program displays the value it has calculated.
*/

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    // Given values: a = 1, r = 0.5, and n = 10.

    int a, n;
    a = 1;
    n = 10;
    double r = 0.5;

    int i = 0;

    // formula: (a * r^i ); the power is increasing with each iteration

    double sum = 0;

    while (i < n)
    {
    sum = a * (pow(r, i)); // Series formula
    cout << "Sum is: " << sum << endl; // display each term
    i++;
    }

    cout<<"Total sum of geometric series is: "<<sum<<endl; // display the total sum

    return 0;
}