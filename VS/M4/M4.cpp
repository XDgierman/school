#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    //inserting data
    ifstream foe;
    foe.open("slowa.txt");
    //main operation
    string text;
    int t41 = 0;
    int t42 = 0;
    int t410, t411;
    for (int i = 0; i < 1000; i++)
    {
        foe >> text;
        //task 4.1
        //count how many there are strings where '0' is dominant over '1'
        t410 = t411 = 0;
        for (int j = 0; j < text.length(); j++)
        {
            if (text[j] == '0')
            {
                t410++;
            }
            else t411++;
        }
        if (t410>t411)
        {
            t41++;
        }
        //task 4.2
        //count how many there are strings that have two blocks of data - block of '0' and block of '1' (eg. 00001111)
        bool fc42 = false;
        bool r42 = false;
        bool b420 = true;
        bool b421 = false;
        int l42 = 0;
        for (int k = 0; k < text.length(); k++)
        {
            if (text[k] == '1') {
                fc42 = true;
            }
        }
        while (fc42 == true and l42 < text.length() and r42 == false)
        {
            if (text[l42] == '1' and b420 == true) {
                b420 = false;
                b421 = true;
            }
            else if (text[l42] == '0' and b421 == true)
            {
                r42 = true;
            }
            l42++;
        }
        if (!r42)
        {
            if (fc42)
            {
                t42++;
            }
        }
    }
    cout << t41 << endl;
    cout << t42 << endl;
    cin.get();
    return 0;
}