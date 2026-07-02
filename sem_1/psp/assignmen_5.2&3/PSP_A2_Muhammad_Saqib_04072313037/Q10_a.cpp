/*
10. (Program) a. An old Arabian legend has it that a fabulously wealthy but unthinking king agreed to give a beggar 1 cent and double the amount for 64 days. Using this information, write, compile, and run a C++ program that displays how much the king must pay the beggar on each day. The output of your program should appear as follows:

Day Amount Owed
--------------
1           0.01
2           0.02
3           0.04
.           .
.           .
.           .
64          .

b. Modify the program you wrote for Exercise 10a to determine on which day the king will have paid the beggar a total of one million dollars.
*/

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    cout<<"\nDay Amount Owed\n";
    cout<<"---------------" <<endl;
    
    double cent = 0.01; 

    for (int i = 1; i  <= 64; i++)
    {   
        cout<<i << setw(15)<< cent << endl;
        cent += cent;
    }
    return 0;
}