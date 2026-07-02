/*
    7. (Program) a. Write, compile, and run a C++ program that displays a table of 20 temperature conversions from Fahrenheit to Celsius. The table should start with a Fahrenheit value of 20 degrees and be incremented in values of 4 degrees. Recall that Celsius = (5.0/9.0) × (Fahrenheit - 32.0).

    b. Modify the program written for Exercise 7a to request the number of conversions to be made.
*/

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    const int MAXNUMS = 20; 
    int num;
    double f = 20.0; // Fahrenheit value of 20 degrees

    cout << endl; // print a blank line
    cout << "Fahrenheit     Celsius\n";
    cout << "----------     -------\n";


    for (num = 1; num <= MAXNUMS; num++) 
    {   
        double Celsius = (5.0/9.0) * (f - 32.0); // formula

        cout << setw(8) << f <<"       "
             << setw(3) << Celsius << endl;

        f += 4; // increment in values of 4 degrees
    }

    return 0;
}