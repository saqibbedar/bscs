/*
    3. (Desk check) Determine the value in total after each of the following loops is executed:

*/

#include<iostream>
using namespace std;

int main() {
    int total;
    int i;

    // (a)
    total = 0;
    for (i = 1; i <= 10; i = i + 1)
    total = total + 1;
    // Total is: 10

    // (b)
    int total = 1;
    for (int count = 1; count <= 10; count = count + 1)
    total = total * 2;
    // Total is: 1024

    // (c)
    int total = 0;
    for (int i = 10; i <= 15; i = i + 1)
    total = total + i;
    // Total is: 75

    // (d)
    int total = 50;
    for (int i = 1; i <= 10; i = i + 1)
    total = total - i;
    // Total is: 40

    // (e)
    int total = 1;
    for (int icnt = 1; icnt <= 8; ++icnt)
    total = total * icnt;
    // Total is: 40320

    // (f)
    double total = 1.0;
    for (int j = 1; j <= 5; ++j)
    total = total / 2.0;
    // Total is: 0.03125

    return 0;
}
