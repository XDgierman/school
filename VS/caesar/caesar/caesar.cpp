#include <iostream>
#include <fstream>
#include "caesar.h"

bool caesar_check(string x, string y) {
    string tmp;
    for (int i = 0; i <= 26; i++)
    {
        tmp = caesar(y, i);
        if (x==tmp)
        {
            return true;
        }
    }
    return false;
}

int main()
{
    ifstream file1;
    ifstream file2;
    ifstream file3;
    ofstream output1;
    ofstream output2;
    ofstream output3;
    file1.open("dane_6_1.txt");
    file2.open("dane_6_2.txt");
    file3.open("dane_6_3.txt");
    output1.open("wyniki_6_1.txt");
    output2.open("wyniki_6_2.txt");
    output3.open("wyniki_6_3.txt");
    string x,y;
    int i,n;
    for (i = 0; i < 1000; i++)
    {
        file1 >> x;
        output1 << caesar(x, 107) << endl;
    }
    for (i = 0; i < 500; i++)
    {
        file2 >> x >> n;
        output2 << decaesar(x, n) << endl;
    }
    for (i = 0; i < 500; i++)
    {
        file2 >> x >> n;
        output2 << decaesar(x, n) << endl;
    }
    for (i = 0; i < 700; i++)
    {
        file3 >> x >> y;
        if (!caesar_check(x,y))
        {
            output3 << x << endl;
        }
    }
}