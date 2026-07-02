/*
4. (Modify) Rewrite Program 5.7 to display the following prompt:
Please type in the total number of data values to be averaged:
Accept input from user and based given number the loop should iterate.
*/

/* 
    Steps: 
    1. Replace the string value
    2. Make Maxnums as a normal integer to accept value from user
*/

#include <iostream>
using namespace std;

int main()
{
    int MAXNUMS; // remove const to use maxnums for "cin>>" statement
    int count = 1;
    double num, total = 0, average;

    cout << "Please type in the total number of data values to be averaged: \n\n"; // String replaced
    cin>>MAXNUMS; // accept input from user for iteration

    while (count <= MAXNUMS) 
    {
        cout << "Enter a number: ";
        cin >> num;
        total = total + num;
        count++;
    }

    count--;
    average = total / count;

    cout << "\nThe average of the numbers is "
         << average << endl;

    return 0;
}