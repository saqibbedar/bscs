/*
    16. (Modify) Modify the program written for Exercise 15 so that the number of test results for each experiment is entered by the user. Write your program so that a different number of test results can be entered for each experiment.
*/

#include <iostream>
#include <string>
using namespace std;

int main()
{
    int experiment = 4; // each has 6 test result

    int testResult; // accept no of test results
    cout<<"Please! Enter no. of test you conducted: ";
    cin>>testResult;
    int i, j;

    string arr[4] = {"1st experiment results: ", "2nd experiment results: ", "3rd experiment results: ", "4th experiment results: "};

    for(i = 0; i < experiment; i++){
        cout<<arr[i];
        double avgResult = testResult/4.0;
        for (j = 0; j < testResult; j++)
        {
            cout<<avgResult<< " ";
            avgResult += 2;
        }
        cout<<endl;
    }
}