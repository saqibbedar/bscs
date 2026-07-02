/*
12. (Program) a. Write, compile, and run a C++ program that calculates and displays the amount of money available in a bank account that initially has $1000 deposited and earns interest at the rate of 3% a year. Your program should display the amount available at the end of each year for a period of 10 years. Use the relationship that the money available at the end of each year = the amount of money in the account at the start of the year + .03 × the amount available at the start of the year.

b. Modify the program written for Exercise 12a to prompt the user for the amount of money initially deposited in the account.

c. Modify the program written for Exercise 12a to prompt the user for both the amount of money initially deposited and the number of years to be displayed.

d. Modify the program written for Exercise 12a to prompt the user for the amount of money initially deposited, the interest rate to be used, and the number of years to be displayed.
*/

//                  ***Part a of Q12***

#include <iostream>
using namespace std;

int main()
{
    double initial_Value = 1000.0; // initial value = $1000.0
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