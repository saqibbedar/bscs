/*
    14. (Program) A well-regarded manufacturer of widgets has been losing 4% of its sales each year. The company’s annual profit is 10% of sales. This year, the company has had $10 million in sales and a profit of $1 million. Determine the expected sales and profit for the next 10 years. 
    
    Your program should produce a display in the following form:


            SALES AND PROFIT PROJECTION
            ---------------------------
    YEAR    EXPECTED SALES      PROJECTED PROFIT
    ----    --------------      ----------------
    1       $10000000.00        $1000000.00
    2       $9600000.00         $960000.00
    3            .                   .
    .            .                   .
    .            .                   .
    .            .                   .
    10           .                   .
    --------------------------------------------------
    Totals: $    .              $    .
*/

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    double lossPercent = 0.04; // 4% loss per year
    double annual_Profit = 10.0/100; // Profit 10%
    
    // currentYear
    double currentYearSale = 10000000.00; // $10 million in sales
    double thisYearProfit = 1000000.00; // $1 million

    // Draw table
    cout<<"\n       SALES AND PROFIT PROJECTION\n";
    cout<<"       ---------------------------\n";
    cout<<"Year     EXPECTED SALES      PROJECTED PROFIT\n";
    cout<<"----     --------------      ----------------\n";

    double expected_Sales;
    double expected_Profit;

    for (int i = 1; i <= 10; i++)
    {
        // Determine the expected sales and profit for the next 10 years.
        expected_Sales = currentYearSale * (1- lossPercent);

        expected_Profit = expected_Sales * thisYearProfit;

        cout<< i << setw(9) << "$"<<expected_Sales << setw(12) <<"$"<< expected_Profit <<endl;
    }
    cout<<"---------------------------------------------\n";
    cout<<"Totals:  $"<<expected_Sales<<setw(12)<<"$"<<expected_Profit<<endl;


    return 0;
}