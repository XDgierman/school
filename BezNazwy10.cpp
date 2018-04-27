//wczytaj 10 znakow, wypisuj czy znak jest litera, cyfra, lub innym znakiem
//wypisz komunikat ile danych cyfr, liter lub znakow zostalo wypisane

#include <iostream>
using namespace std;

int main(){
	char a;
	int z=0,c=0,l=0,i;
	for (i=0;i<10;i++){
		cout<<"Wpisz znak: ";
		cin>>a;
		if (((a>='a')&(a<='z'))|((a>='A')&(a<='Z'))) {
			l++;
			cout<<"Wpisales litere"<<endl;
		}
		else if ((a>='0')&(a<='9')) {
			c++;
			cout<<"Wpisales cyfre"<<endl;
		}
		else {
			z++;
			cout<<"Wpisales znak"<<endl;
		}
	}
	cout<<"Wpisales "<<z<<" znakow, "<<c<<" cyfr i "<<l<<" liter";
return 0;
}

