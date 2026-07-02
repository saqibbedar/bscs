/*
    8. (Program) a. Write a C++ program to convert Celsius degrees to Fahrenheit. The program should request the starting Celsius value, the number of conversions to be made, and the increment between Celsius values. The display should have appropriate headings and list the Celsius value and the corresponding Fahrenheit value. Use the relationship that Fahrenheit = (9.0 / 5.0) * Celsius + 32.0.


    b. Compile and run the program written in Exercise 8a on a computer. Verify that your program begins at the correct starting Celsius value and contains the exact number of conversions specified in your input data.

*/

//              ***Answer of part a & b of Q7***

// (a & b): The program is written below and working fine

#include <iostream>
#include <string>
using namespace std;

int main()
{
    // Display heading
    cout<<"\n*** This program will convert the No. of Celsius degrees to Fahrenheit degrees ***\n"<<endl;

    double celsius; // starting starting Celsius value
    cout<<"Enter the starting Celsius value: ";
    cin>>celsius; // celsius value

    double n; // number of conversions
    cout<<"Enter the No. of Conversions: ";
    cin>>n; 

    double f; // Fahrenheit

    int count = 1;
    double i;
    while (count <= n)
    {
        f = (9.0 / 5.0) * celsius + 32.0; // formula to convert Celsius to Fahrenheit
        celsius = celsius + i; // increment

        count++;
    }
    cout<<endl; // for spacing and line break
    cout<<celsius<<" Celsius degrees are equal to "<< f << " Fahrenheit degrees ";

    return 0;

}