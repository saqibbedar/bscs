/*
    8. (Program) Write, compile, and run a C++ program that converts Fahrenheit to Celsius temperature in increments of 5 degrees. The initial value of Fahrenheit temperature and the total conversions to be made should be requested as user input during program execution. Recall that Celsius = (5.0/9.0) × (Fahrenheit - 32.0).
*/

#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main()
{   
    // ***The previous program will remain almost same with few changes***

    string h1 = "***This program will convert Fahrenheit degree to Celsius***";
    cout<<endl<<h1<<endl; // main heading

    double f; // Fahrenheit value of 20 degrees
    cout<<"\nPlease! Enter Fahrenheit temp value: ";
    cin>>f;

    int MAXNUMS;
    cout<<"Please! Enter No. of Conversion: ";
    cin>>MAXNUMS;

    int num;

    cout << endl; // print a blank line
    cout << "Fahrenheit     Celsius\n";
    cout << "----------     -------\n";


    for (num = 1; num <= MAXNUMS; num++) 
    {   
        double Celsius = (5.0/9.0) * (f - 32.0); // formula

        cout << setw(8) << f <<"       "
             << setw(3) << Celsius << endl;

        f += 5; // increments of 5 degrees
    }

    return 0;
}