/*
    b. Modify the program written for Exercise 11a to also compute and display the cumulative mpg after each fill-up. The cumulative mpg is calculated as the difference between mileage at each fill-up and mileage at the start of the trip divided by the sum of gallons used to that point in the trip. 
*/

// Part b of Q11:

#include <iostream>
using namespace std;

int main()
{
    // Not repeating whole previous program just modifying the program based on the question11 (b) requirements:

    double mileage, gallons;
    double cumulativeMpg; // cumulative mpg

    cout << "Enter no. of Miles covered: " <<endl;
    cin >> mileage; 
    cout<<"Enter no. of Gasoline used: ";
    cin>>gallons; 

    cumulativeMpg = mileage / gallons; // calculate cumulativeMpg

    cout << "Miles per gallon used: " << cumulativeMpg << endl; // Total sum

    return 0;
}


