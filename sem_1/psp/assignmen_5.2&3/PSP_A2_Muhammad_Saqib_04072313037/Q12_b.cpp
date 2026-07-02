/*
    b. Modify the program written for Exercise 12a to prompt the user for the amount of money initially deposited in the account.
*/

//                  ***Part B of Q12***

#include <iostream>
using namespace std;

int main()
{
    double initial_Value; // prompt user to enter amount of money
    cout<<"Please! Enter amount of money: "; // prompt
    cin>>initial_Value; // accept money

    double interest_Rate = 0.03; // interest rate Per year 3%
    int nOfYears = 10; // period of 10 years

    cout<<"\nYear       Available Money\n";
    cout<<"---------------" <<endl;

    double final_Value = initial_Value; // money available at the end of each year = the amount of money in the account
    for (int i = 1; i <= nOfYears; i++)
    {
        final_Value = initial_Value + (interest_Rate * final_Value);

        cout<<i <<"     :      " << final_Value <<endl;
    }
    return 0;
}