/*
    9. (Program) a. Write, compile, and run a C++ program that accepts five values of gallons, one at a time, and converts each value entered to its liter equivalent before the next value is requested. Use a for loop in your program. There are 3.785 liters in 1 gallon of liquid.
    
    b. Modify the program written for Exercise 9a to request the number of data items to be entered and converted first.

*/
#include <iostream>
using namespace std;

int main()
{
    // lets create an array of gallons to accept five values and print their result

    double g[5]; // array of gallons
    int i;
    for ( i = 0; i < 5; i++)
    {
        cout<<"\nEnter a gallon value: ";
        cin>>g[i];

        // convert each value entered to its liter before the next value is requested
        double liters = g[i] * 3.785;
        cout<<g[i] <<" gallons are equals to " << liters << " liters" <<endl;

    }
    
    return 0;
}