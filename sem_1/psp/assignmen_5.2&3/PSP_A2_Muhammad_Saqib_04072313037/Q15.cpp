/*
    15. (Program) Four experiments are performed, and each experiment has six test results. The results for each experiment are given in the following list. Write, compile, and run a C++ program using a nested loop to compute and display the average of the test results for each experiment.

    1st experiment results: 23.2 31 16.9 27.5 25.4 28.6
    2nd experiment results: 34.8 45.2 27.9 36.8 33.4 39.4
    3rd experiment results: 19.4 16.8 10.2 20.8 18.9 13.4
    4th experiment results: 36.9 39.5 49.2 45.1 42.7 50.6
*/

#include <iostream>
#include <string>
using namespace std;

int main()
{
    int experiment = 4; // each has 6 test result
    int testResult = 6;
    int i, j;

    string arr[4] = {"1st experiment results: ", "2nd experiment results: ", "3rd experiment results: ", "4th experiment results: "};

    for(i = 0; i < experiment; i++){
        cout<<arr[i];
        double avgResult = 6.0/4.0;
        for (j = 0; j < testResult; j++)
        {
            cout<<avgResult<< " ";
            avgResult += 2;
        }
        cout<<endl;
    }
}