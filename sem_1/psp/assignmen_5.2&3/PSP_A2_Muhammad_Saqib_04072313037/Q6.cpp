/*
    6. (Modify) Modify Program 5.10 to produce a table of numbers from 10 to 1, instead of 1 to 10, as it currently does.
*/

#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    const int MAXNUMS = 1; // change the MAXNUMS value to 1
    int num;

    cout << endl; // print a blank line
    cout << "NUMBER     SQUARE     CUBE\n";
    cout << "------     ------     ----\n";

    // set num to 10 and adjust the condition to iterate for 10 times and decrement the num value with each iteration
    
    for (num = 10; num >= MAXNUMS; num--) 
    {
        cout << setw(3) << num <<"      "
             << setw(3) << num * num<< "        "
             << setw(4) << num * num * num << endl;
    }

    return 0;
}