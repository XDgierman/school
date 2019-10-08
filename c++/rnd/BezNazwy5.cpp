#include <iostream>
using namespace std;

int main(){
	string i;
	int x;
	cout<<"Podaj swoje imie: "<<endl;
	cin>>i;
	cout<<"Podaj swoj wzrost: "<<endl;
	cin>>x;
	if (x>=180) {
		cout<<"Witaj "<<i<<", jestes wysokiego wzrostu"<<endl;
	}
	else if (x<160) {
		cout<<"Witaj "<<i<<", jestes niskiego wzrostu"<<endl;
}
else cout<<"Witaj "<<i<<", jestes sredniego wzrostu."<<endl;
	
	return 0;
}
