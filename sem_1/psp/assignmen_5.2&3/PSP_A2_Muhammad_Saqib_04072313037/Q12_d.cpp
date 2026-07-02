/*
    d. Modify the program written for Exercise 12a to prompt the user for the amount of money initially deposited, the interest rate to be used, and the number of years to be displayed.
*/

//                  ***Part D of Q12***

#include <iostream>
using namespace std;

int main()
{
    double initial_Value; // prompt user to enter amount of money
    cout<<"Please! Enter amount of money: "; // prompt
    cin>>initial_Value; // accept money

    double interest_Rate; // read interest rate
    cout<<"Please! Enter the Interest Rate: "; // prompt
    cin>>interest_Rate;

    // calculate given interest Rate
    interest_Rate = interest_Rate/100; // interest_Rate%

    int nOfYears; // read no of years from user
    cout<<"Please! Enter No. of Years: "; // prompt
    cin>>nOfYears;

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