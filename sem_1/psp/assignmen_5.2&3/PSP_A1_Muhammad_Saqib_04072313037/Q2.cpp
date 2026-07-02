/*
    2. (Modify) Rewrite Program 5.6 to display this prompt:
    "Please type in the total number of data values to be added:"
    Accept input from user and based on given number the loop should iterate.
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
    int MAXNUMS; // remove the const to use maxnums for "cin>>" statement

    cout << "\n Please type in the total number of data values to be added: \n"; // string replaced
    cin>>MAXNUMS; // accept input

    int count;
    double num, total;

    count = 1;
    total = 0;

    while (count <= MAXNUMS)
    {
        cout << "\nEnter a number: ";
        cin >> num;
        total = total + num;
        cout << "The total is now " << total;
        count++;
    }

    cout << "\n\nThe final total is " << total << endl;

    return 0;
}