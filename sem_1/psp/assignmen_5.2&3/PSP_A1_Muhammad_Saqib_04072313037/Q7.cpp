/* 7. (Modify) a. Modify the program written in Exercise 6a to request the starting meter value, the ending meter value, and the increment. Instead of the condition checking for a fixed count, it checks for the ending meter value. If the number of iterations is greater than 20, have your program substitute a default increment of (ending value - starting value) / 19.

b. Run the program written in Exercise 7a on a computer. Verify that your output starts at the correct beginning value and ends at the correct ending value. */

//              ***Answer of part a & b of Q7***

// (a & b): The program is modified below and working fine

#include <iostream>
using namespace std;

int main()
{
    // Display heading
    cout<<"\n***This program will convert the No. of Meters into Feet***\n"<<endl;

    double feet = 3.281; // 1 meter = 3.281 feet

    double sM; // start Meter value
    cout<<"Enter the starting No. of Meters: ";
    cin>> sM;

    double eM; // end Meter value
    cout<<"Enter the Ending No. of Meters: ";
    cin>> eM;

    double n; // number of conversion
    cout<<"Enter No. of Conversion of Meters: ";
    cin>>n; 

    int i; // increment
    cout<<"Enter increment value: ";
    cin>>i; // accepting i as per programs requirement

    if (eM > 20){

        i = (eM - sM) / 19;

        //Instead of the condition checking for a fixed count, it checks for the ending meter value. If the number of iterations is greater than 20, have your program substitute a default increment of (ending value - starting value) / 19.
    }

    double sum = 0;

    int count = 1;
    while (count <= n)
    {
        sum = sM * feet; // converts to feet
        sM = sM + i;

        count++;
    }
    cout<<endl;
    cout<<sM<<" meters are equal to "<<sum << " feet";

    return 0;

}