// 1. (Modify) Rewrite Program 5.6 to compute the total of eight numbers.

/*
    Steps: 
    1. Change MAXNUMS value to 8
*/

#include <iostream>
using namespace std;

int main()
{
    const int MAXNUMS = 8; // Change MAXNUMS value from 4 to 8
    int count;
    double num, total;

    cout << "\nThis program will ask you to enter " << MAXNUMS << " numbers.\n";
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