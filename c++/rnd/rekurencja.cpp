//oblicz rekurencyjnie a^b
//oblicz nwd metod¹ euklidesa rekurencyjnie
//oblicz rekurencyjnie elementy ci¹gu fibbonaciego
#include <iostream>
#include <cmath>
using namespace std;

long int power(int x, int y){
	if(y==0) return 1;
	else if (y==1) return x;
	else return power(x, y-1)*x;
}

int eucli(int x, int y){
	if (x==y) return x;
	else if (x>y) return eucli(x-y,y);
	else if (x<y) return eucli(x,y-x);
}

int fib(int x){
	if (x==1 or x==2) return 1;
	else return fib(x-1)+fib(x-2);
}
int main(){
cout<<fib(6);
}
