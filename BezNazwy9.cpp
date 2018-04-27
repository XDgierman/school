//wczytaj 5 liczb, wypisz wartosc srednia
#include <iostream>
using namespace std;

int main(){
	int i;
	float x, y=0;
	cout<<"Wprowadz 5 liczb, a powiem jaka jest ich srednia"<<endl;
for (i=0; i<5; i++){
	cin>>x;
	y=y+x;
}
	x=y/5;
cout<<"Srednia tych 5 liczb wynosi "<<x;

	return 0;
}
