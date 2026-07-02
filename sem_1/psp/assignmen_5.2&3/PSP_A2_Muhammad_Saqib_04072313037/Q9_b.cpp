/* b. Modify the program written for Exercise 9a to request the number of data items to be entered and converted first.
*/
#include <iostream> 
using namespace std;

int main()
{
    double n; // number of data items to be entered and converted first
    cout<<"\nPlease! Enter number of data items to be entered and converted first: ";
    cin>>n;

    int i;
    double dataItems; // for accepting input based on the number of n

    for ( i = 1; i <= n; i++)
    {
        cout<<"\nEnter a gallon value: ";
        cin>>dataItems;

        // convert each value entered to its liter before the next value is requested
        double liters = dataItems * 3.785;
        cout<<dataItems <<" gallons are equals to " << liters << " liters" <<endl;

    }
    return 0;
}