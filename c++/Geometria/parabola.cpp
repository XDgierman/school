#include <iostream>
#include <fstream>
#include <cmath>
#include <iomanip>
using namespace std;

int main(){
	int delta_status;
	float delta,a,b,c,x1,x2;
	cout<<"Wprowadz wartosc a (ax^2): ";
	cin>>a;
	cout<<"Wprowadz wartosc b (bx): ";
	cin>>b;
	cout<<"Wprowadz wartosc c: ";
	cin>>c;
	//cout<<a<<" "<<b<<" "<<c;
	delta=(b*b)-(4*(a*c));
	//cout<<delta<<endl;
	if (delta > 0) {
		delta_status=0;
		x1=(-b-sqrt(delta))/(2*a);
		x2=(-b+sqrt(delta))/(2*a);
	} else if (delta == 0) {
		delta_status=1;
		x1=-b/(2*a);
	} else {
		delta_status=2;
	}
	switch (delta_status){
		case 0:
			//cout<<"x1 - "<<x1<<", x2 - "<<x2;
			for (float i=x1;i<x2+0.01;i+=0.01){
				pt+=((dlugosc(i-0.01)+dlugosc(i))/2.00)*0.01;
				//cout<<dlugosc(i-0.01)<<" "<<dlugosc(i)<<endl<<pt<<endl<<endl;
				cout<<i<<endl;
			}
			break;
		case 1:
			cout<<"x1 - "<<x1<<"Brak paraboli";
			break;
		case 2:
			cout<<"Brak punktow zerowych";
			break;
	}
}
