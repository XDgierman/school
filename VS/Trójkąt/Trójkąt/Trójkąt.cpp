#include <iostream>
#include <fstream>

using namespace std;

float trojkat(float x1, float y1, float x2, float y2) {
    float a, b, c, d, pole;
    a = (y2 - y1) / (x2 - x1);
    if (a == 0) {
        return -1;
    }
    else {
        b = y1 - (a * x1);
        c = b;
        d = (-1 * b) / a;
        pole = (d / 2) * c;
        return fabsf(pole);
    }
}

int main()
{
    ifstream file;
    file.open("wsp1000.txt");
    float x1, x2, y1, y2;
    float min=99999999,max=-1;
    for (int i = 0; i < 1000; i++)
    {
        file >> x1;
        file >> y1;
        file >> x2;
        file >> y2;
        float pole = trojkat(x1, y1, x2, y2);
        if (pole != -1) {
            if (pole > max)
            {
                max = pole;
            }
            if (pole < min) {
                min = pole;
            }
        }
    }
    cout << min << " " << max << endl;
    cin.get();
    return 0;
}
