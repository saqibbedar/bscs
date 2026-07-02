// 3. (Modify) Rewrite Program 5.7 to compute the average of 10 numbers.
/*
    Steps: 
    1. Change MAXNUMS value to 10 
*/

#include <iostream>
using namespace std;

int main()
{
    const int MAXNUMS = 10; // Modify the MAXNUMS value from 4 to 10
    int count = 1;
    double num, total = 0, average;

    cout << "\nThis program will ask you to enter "
         << MAXNUMS << " numbers.\n\n";

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
