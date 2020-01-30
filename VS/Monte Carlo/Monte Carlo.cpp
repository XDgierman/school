#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

/*bool monte(int x, int y, bool carlo = false) {
    int xy, r = 200;
    xy = sqrt(x - r) + sqrt(y - r);
    if (carlo == false and xy < sqrt(r)) {
        return true;
    }
    else if (carlo == true and xy == sqrt(r)) {
        return true;
    }
    else return false;
}*/

bool monte(int x, int y) {
    int xy, r = 200;
    xy = (x - r) * (x - r) + (y - r) * (y - r);
    cout << xy << endl;
    if (xy < (r*r)) {
        return true;
    }
    else return false;
}

int main()
{
    ifstream file;
    file.open("punkty.txt");
    int count = 0;
    int x, y;
    for (int i = 0; i < 100; i++)
    {
        file >> x >> y;
        if (monte(x, y)) {
            count++;
        }
    }
    cout << count << endl;
    cin.get();
    return 0;
}
