/*
    b. Modify the program written for Exercise 7a to request the number of conversions to be made.
*/

//                  ***Part B***

#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main()
{   
    string h1 = "***This program will convert Fahrenheit degree to Celsius***";
    cout<<endl<<h1<<endl; // main heading

    int MAXNUMS; // remove const to use it for input 
    cout<<"\nPlease! Enter No. of Conversion: ";
    cin>>MAXNUMS;
 
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