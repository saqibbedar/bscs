/*
    13. (Modify) Modify the program you wrote for Exercise 12 to keep requesting and displaying results until a sentinel value of 999 is entered. Compile and run your program. Review the display your program produces and verify that the output is correct.
*/

//  ***Whole program will remain same except the whiles condition to check whether 999 is entered or not, if entered then loop will stop else it will ask the user again and again to enter data

#include <iostream>
using namespace std;

int main()
{
    // declare the required variables 
    double bookID, invBalance, soldItems, receivedItems;

    string arr1[4] = {"Book ID", "Inventory Balance", "Copies Received during month", "Copies Sold during month"}; // array for displaying msg to user

    while (true)
    {

        cout<<"\n ***Please Enter the Data*** \n \n";

        // for loop to display array1 values to user
        for (int i = 0; i < 4; i++)
        {
            cout<<arr1[i] <<endl;
        }

        cin>> bookID >> invBalance >> soldItems >> receivedItems;

        // condition to check if 999 is entered?
        // if yes than break loop and print final output

        if (bookID == 999 || invBalance == 999 || soldItems == 999 || receivedItems == 999)
        {

            // calculate the newBalance using formula given in Question: 

            double newBalance = invBalance + soldItems - receivedItems;

            cout<<"New Inventory Balance of book no. "<< bookID<< " is: "<< newBalance << endl;

            break;
        }
        
        // if 999 not entered then display the result, the loop will continue until 999 is not entered

        else{
            // calculate the newBalance
            double newBalance = invBalance + soldItems - receivedItems;

            cout<<"New Inventory Balance of book no. "<< bookID<< " is: "<< newBalance << endl;
        }

    }

    return 0;
}