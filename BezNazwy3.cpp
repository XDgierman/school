#include <iostream>
using namespace std;

int main(){
	float x;
	cout<<"Podaj liczbe rzeczywista: "<<endl;
	cin>>x;
	if (x>0) {
		cout<<"Liczba jest dodatnia"<<endl;
	}
	if (x<0) {
		cout<<"Liczba jest ujemna"<<endl;
	}
	if (x==0) {
		cout<<"Liczba jest zerem"<<endl;
	}
	
	
	return 0;
}
