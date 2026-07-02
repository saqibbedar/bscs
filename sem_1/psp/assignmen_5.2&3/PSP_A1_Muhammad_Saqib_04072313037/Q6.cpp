/*
6. (Program) a. Write a C++ program to convert meters to feet. The program should request the starting meter value, the number of conversions to be made, and the increment between metric values. The display should have appropriate headings and list the meters and corresponding feet value. If the number of iterations is greater than 10, have your program substitute a default increment of 10. Use the relationship that 1 meter = 3.281 feet.
*/

//              ***Answers of part a & b of Q6***

// (a & b): The program is written below and working fine

#include <iostream>
using namespace std;

int main()
{
    // Display heading
    cout<<"\n***This program will convert the No. of Meters into Feet***\n"<<endl;

    double feet = 3.281; // 1 meter = 3.281 feet

    double meters; // number of meters
    cout<<"Enter the No. of Meters: ";
    cin>> meters;

    double n; // number of conversion
    cout<<"Enter No. of Conversion: ";
    cin>>n; 

    int i; // increment
    if (n > 10){
        i = 10;
        // If the number of iterations is greater than 10, have your program substitute a default increment of 10.
    }
    else{
        i = 0;
    }

    double sum = 0;

    int count = 1;
    while (count <= n)
    {
        sum = meters * feet; // converts to feet
        meters = meters + i;

        count++;
    }
    cout<<endl;
    cout<<meters<<" meters are equal to "<<sum << " feet";

    return 0;

}