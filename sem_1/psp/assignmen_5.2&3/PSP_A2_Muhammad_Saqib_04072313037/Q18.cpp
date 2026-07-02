/*
18. (Program) Write, compile, and run a C++ program that calculates and displays the yearly amount available if $1000 is invested in a bank account for 10 years. Your program should display the amounts available for interest rates from 6% to 12%, inclusive, in 1% increments. 

Use a nested loop, with the outer loop having a fixed count of 7 and the inner loop having a fixed count of 10. The first iteration of the outer loop should use an interest rate of 6% and display the amount of money available at the end of the first 10 years. In each subsequent pass 
through the outer loop, the interest rate should be increased by 1%. Use this relationship: money available at end of each year = amount of money in account at start of the year + interest rate × amount available at start of the year.

*/


#include <iostream>
using namespace std;

int main()
{
    double interest_Rate = 0.06; // interest rates from 6% to 12% 
    double initial_Amount = 1000.0;
    double final_Amount = initial_Amount;

    cout<<"\nInterest Rate     Available Amount\n";
    cout<<"----------------------------------" <<endl;    

    for (int i = 1; i <= 7; i++)
    {
        for (int j = 1; j <= 10; j++)
        {
            final_Amount = initial_Amount + (interest_Rate * initial_Amount);
        }
        cout<<interest_Rate <<"%                     $"<<final_Amount;
        interest_Rate += 0.01; // 1% increments
        cout<<endl;
    }
    
}