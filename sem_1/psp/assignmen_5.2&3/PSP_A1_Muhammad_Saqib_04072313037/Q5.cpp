/*                       ***Question***

5. (Debug) By mistake, a programmer puts the statement 
average = total/count; in the while loop immediately after the statement total = total+ num; in Program 5.7. 

As a result, the while loop becomes the following:
while(count<= MAXNUMS)
{
cout<<“Enter a number: “;
cin>>num;
total= total+num;
average= total/count;
count++;
}
a. Will the program yield the correct result with this while loop?
b. From a programming perspective, which while loop is better to use, and why?
*/

//                       ***Answers***

// a. Will the program yield the correct result with this while loop?

// No, the program will not give correct results because average = total / count; will keep on changing with each iteration, and counts increment (count++) will come in effect after the 1st average is calculated, moreover, it is not even right way to find average because to find average we must have the all values first then dividing them with total numbers, so that way is more suitable to find the average of any number.  Hence, program with a bug will definitely effect the final results, it may give correct results for few numbers but not always. 

// b. From a programming perspective, which while loop is better to use, and why? 

// The while loop without a bug is good one, because we are calculating the average once all results are in our hand. When loop will complete its iterations then calculating average is a good way to solve this problem. And from a programming prospective, it is not a good approach to find average on each iteration as there is no use of it inside the loops body, so calculating the average outside the loops body would be a better option. Inshort, the loop without bug is far better than the loop with bugs. 

// Below is the code to examine whether which loop is better...


#include "iostream";
using namespace std;

int main()
{
    int MAXNUMS = 4; 
    int count = 1;
    double num, total = 0, average;

    cout << "\nThis program will ask you to enter "
         << MAXNUMS << " numbers.\n\n";

    while (count <= MAXNUMS)
    {
        cout << "Enter a number: ";
        cin >> num;
        total = total + num;
        average = total / count; // addition by a programmer with mistake
        count++;
    }

    count--;

    // average = total / count; // actual code statement

    cout << "\nThe average of the numbers is "
         << average << endl;

    return 0;
}