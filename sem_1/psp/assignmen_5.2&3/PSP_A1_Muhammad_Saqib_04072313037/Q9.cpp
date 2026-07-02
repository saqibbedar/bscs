/*
    9. (Program) An arithmetic series is defined by the following:

    a + (a + d ) + (a + 2d ) + (a + 3d ) + ˙˙˙ + [(a + (n - 1)d )]
    a is the first term.
    d is the “common difference.”
    n is the number of terms to be added.

    Using this information, write a C++ program that uses a while loop to display each term and determine the sum of the arithmetic series having a = 1, d = 3, and n = 100. Make sure your program displays the value it has calculated.
*/

#include <iostream>
using namespace std;

int main()
{
    // Given values: a = 1, d = 3, and n = 100.

    int a, d, n;
    a = 1;
    d = 3;
    n = 100;

    int i = 0;
    
    // formula: (a + i*d );

    int sum = 0;

    while (i < n)
    {
    sum = (a + i * d); // formula: (a + i*d );
    cout << "Sum of term: "<< i << " is " << sum << endl; // display each term
    i++;
    }

    cout<<"Total sum of arithmetic series is: "<<sum<<endl; // display the total sum

    return 0;
}