/* 5. (Modify) Modify Program 5.10 to produce a table of the numbers 0 through 20 in increments of 2, with their squares and cubes.
*/

#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    const int MAXNUMS = 20; // change the MAXNUMS value to 20
    int num;

    cout << endl; // print a blank line
    cout << "NUMBER     SQUARE     CUBE\n";
    cout << "------     ------     ----\n";

    // set num to 0 and adjust the condition to iterate for 20 times and add increment of +2 to num
    
    for (num = 0; num < MAXNUMS; num+=2) 
    {
        cout << setw(3) << num <<"      "
             << setw(3) << num * num<< "        "
             << setw(4) << num * num * num << endl;
    }

    return 0;
}
