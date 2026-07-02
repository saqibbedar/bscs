/*
    13. (Program) According to legend, the island of Manhattan was purchased from the native Indian population in 1626 for $24. Assuming this money was invested in a Dutch bank paying 4% simple interest per year, construct a table showing how much money the native population would have at the end of each 50-year period, starting in 1626 and ending 400 years later. Use the relationship that the money available at the end of each 50-year period = the amount of money in the account at the start of period × the quantity (1 + .04)50.
*/

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    double island_Purchased = 24.0; // $24
    double interest_Rate = 0.04; // IR 4% per year
    int totalYears = 1626 + 400; // totalYears

    // construct a table showing how much money the native population would have at the end of each 50-year period
    cout<<"\n  Year           Money Paid\n";
    cout<<"     -------------------" <<endl;

    for (int i = 1626; i <= totalYears; i+= 50)
    {
        double finalMoney = island_Purchased * pow(1 + interest_Rate, 50);

        cout<<i << "        :       "<< "$"<<finalMoney<<endl;
    }
    
    return 0;
}