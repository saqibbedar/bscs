// 2. (Desk check) Determine the number of times each for loop is executed for the for statements written in Exercise 1.

#include <iostream>
using namespace std;

int main()
{

    for (int i = 1; i <= 20; i++)
    {
        // This loop will iterate for 20 times
    }


    for (int icount = 1; icount <= 20; icount += 2)
    {
        // This loop will iterate for 10 times
    }

    for (int j = 1; j <= 100; j+= 5)
    {
        // This loop will iterate for 20 times
    }

    for (int icount = 20; icount <= 1; icount--)
    {
        // This loop will not execute as initial value icount = 20 and it is not less than or equal to 1 but it is greater than it

    }

    for (int icount = 20; icount <= 1; icount-= 2)
    {
        // This loop will also not execute because of given condition
    }

    
    // int b = 1; // initialized b to count the belows loop iteration 
    for (double count = 1.0; count <= 16.2; count += 0.2)
    {
        // This loop will iterate for 77 times

        // cout<< b << " " << count << endl; // for checking iteration
        // b++; // increment to see the number
    }


    for (double xcnt = 20.0; xcnt <= 10.0; xcnt += -0.5)
    {
        // This loop will not execute
    }
}