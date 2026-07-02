/*
    12. (Program) a. A bookstore summarizes its monthly transactions by keeping the following information for each book in stock:
    
    Book identification number
    Inventory balance at the beginning of the month
    Number of copies received during the month
    Number of copies sold during the month

    Write a C++ program that accepts this data for each book and then displays the book identification number and an updated book inventory balance, using this relationship:

    New balance = Inventory balance at the beginning of the month
    + Number of copies received during the month
    - Number of copies sold during the month

    Your program should use a while statement with a fixed-count condition so that information 
    on only three books is requested.

    b. Compile and run the program written in Exercise 12a. Review the display your program 
    produces and verify that the output is correct.
*/

// Answer (a, b): The program is written below and working fine with required conditions

#include <iostream>
#include <string>
using namespace std;

int main()
{
    // declare the required variables 
    double bookID, invBalance, soldItems, receivedItems;

    string arr1[4] = {"Book ID", "Inventory Balance", "Copies Received during month", "Copies Sold during month"}; // array for displaying msg to user

    int count = 1; // whiles initialization

    while (count <= 3) // 3 fixed number as per requirement
    {

        cout<<"\n ***Please Enter the Data*** \n \n";

        // for loop to display array1 values to user
        for (int i = 0; i < 4; i++)
        {
            cout<<arr1[i] <<endl;
        }

        cin>> bookID >> invBalance >> soldItems >> receivedItems;

        // calculate the newBalance using formula given in Question: 

        double newBalance = invBalance + soldItems - receivedItems;

        // display the result
        cout<<"New Inventory Balance of book no. "<< bookID<< " is: "<< newBalance << endl;

        count++;
    }

    return 0;
}