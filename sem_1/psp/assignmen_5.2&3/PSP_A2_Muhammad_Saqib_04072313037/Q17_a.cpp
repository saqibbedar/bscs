/*
17. (Program) a. A bowling team consists of five players, and each player bowls three games. Write, compile, and run a C++ program that uses a nested loop to enter each player’s scores and then computes and displays the average score for each bowler. Assume each bowler has the following scores:

    1st bowler: 286 252 265
    2nd bowler: 212 186 215
    3rd bowler: 252 232 216
    4th bowler: 192 201 235
    5th bowler: 186 236 272

b. (Modify) Modify the program written for Exercise 17a to calculate and display the average team score. (Hint: Use a second variable to store the total of all players’ scores.)

c. (Modify) Rewrite the program written for Exercise 17a to eliminate the inner loop. To do this, you have to input three scores for each bowler rather than enter one at a time. Each score must be stored in its own variable name before the average is calculated.

*/

#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
    int bowlingTeam = 5; // bowling team consists of five players
    int bowled = 3; // each player bowls three games

    string bowlers[5] = {"1st bowler: ", "2nd bowler: ","3rd bowler: ","4th bowler: ","5th bowler: "};

    // int score2[3] = {212, 186, 215};
    // int score1[3] = {286, 252, 265};
    // int score3[3] = {252, 232, 216};
    // int score4[3] = {192, 201, 235};
    // int score5[3] = {186, 236, 272};
    
    // single array was not working, search from internet and solution was to use 2d array and I have used below 2d array to print the given scores

    int twoD_Array[5][3] = {
        {286, 252, 265},
        {212, 186, 215},
        {252, 232, 216},
        {192, 201, 235},
        {186, 236, 272}
    };

    for (int i = 0; i < bowlingTeam; i++)
    {
        cout<<bowlers[i];
        for (int j = 0; j < bowled; j++)
        {
            cout<<twoD_Array[i][j] << " "; // 2d array would be applied here
        }
        cout<<endl;
    }
}