/*
    11. (Program):

    a. Write, compile, and run a C++ program that accepts a mileage and gallons value and calculates the miles per gallon (mpg) for that segment of the trip. The mpg is calculated as the difference in mileage between fill-ups divided by the number of gallons of gasoline used in the fill-up.
     
*/

// Part a of Q11:

#include <iostream>
using namespace std;

int main()
{
    double mileage, gallons;
    double mpg; // miles per gallon

    cout << "Enter mileage and gallons" <<endl;
    cin >> mileage >> gallons; // accept mileage and gallons value

    mpg = mileage / gallons; // calculate mpg

    cout << "Miles per gallon are: " << mpg << endl; // Print total sum(mpg)

    return 0;
}


