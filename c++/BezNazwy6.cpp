#include <iostream>
using namespace std;

int main(){
int a, b, c, d, e;
	cout<<"Podaj pierwsza cyfre "<<endl;
	cin>>a;
	cout<<"Podaj druga cyfre "<<endl;
	cin>>b;
	cout<<"Podaj trzecia cyfre "<<endl;
	cin>>c;
	
	if (a>=b) d=a;
	else d=b;
	if (d>=c) e=c;
	else e=d;
	
	cout<<"Srodkowa liczba jest "<<e<<endl;

	return 0;
}
