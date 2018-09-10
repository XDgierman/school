#include <iostream>

using namespace std;

class Fibonacci{
public:
    long int a, b, c;
    void generate(long int);
};

void Fibonacci::generate(long int n){
    a = 0; b = 1;
    cout << a << " " <<b;
    for(long int i=1; i<= n-2; i++){
        c = a + b;
        cout << " " << c;
        a = b;
        b = c;
    }
}

int main()
{
    cout << "Hello world! Fibonacci series" << endl;
    cout << "Enter number of items you need in the series: ";
    long int n;
    cin  >> n;
    Fibonacci fibonacci;
    fibonacci.generate(n);
    return 0;
}
