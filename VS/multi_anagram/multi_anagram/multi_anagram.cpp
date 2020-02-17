#include <iostream>
#include <fstream>
using namespace std;

bool table_check(int x1[],int x2[],int x3[],int x4[],int x5[]){
    for (int i = 0; i < 26;i++)
    {
        if (x2[i] != x1[i] or x3[i] != x1[i] or x4[i] != x1[i] or x5[i] != x1[i])
        {
            return false;
        }
    }
    return true;
}

int main()
{
    ifstream file;
    ofstream odpA;
    ofstream odpB;
    file.open("anagram.txt");
    odpA.open("odp_4a.txt");
    odpB.open("odp_4b.txt");

    string x1, x2, x3, x4, x5;
    string a1 = "", a2 = "", a3 = "", a4 = "", a5 = "";
    int x_length1, x_length2, x_length3, x_length4, x_length5;
    int p1, p2, p3, p4, p5;
    int k1[26], k2[26], k3[26], k4[26], k5[26];


    for (int k_size = 0; k_size <= 25; k_size++)
    {
        k1[k_size] = k2[k_size] = k3[k_size] = k4[k_size] = k5[k_size] = 0;
    }
    for (int file_size = 0; file_size < 200; file_size++)
    {
        file >> x1 >> x2 >> x3 >> x4 >> x5;
        x_length1 = x1.length();
        x_length2 = x2.length();
        x_length3 = x3.length();
        x_length4 = x4.length();
        x_length5 = x5.length();
        if (x_length1 == x_length2 and x_length1 == x_length3 and x_length1 == x_length4 and x_length1 == x_length5)
        {
            odpA << x1 << " " << x2 << " " << x3 << " " << x4 << " " << x5 << endl;
            for (int word_size = 0; word_size < x_length1; word_size++)
            {
                p1 = (int)x1[word_size] - 65;
                p2 = (int)x2[word_size] - 65;
                p3 = (int)x3[word_size] - 65;
                p4 = (int)x4[word_size] - 65;
                p5 = (int)x5[word_size] - 65;
                k1[p1]++;
                k2[p2]++;
                k3[p3]++;
                k4[p4]++;
                k5[p5]++;
            }
            if (table_check(k1, k2, k3, k4, k5)) {
                odpB << x1 << " " << x2 << " " << x3 << " " << x4 << " " << x5 << endl;
            }
        }
    }
}