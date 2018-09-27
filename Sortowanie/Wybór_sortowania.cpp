#include <iostream>
#include <fstream>
using namespace std;

int sbab(int a, int b);
int sszb(int a, int b);
int spwst(int a, int b);
int spwyb(int a, int b);
int w, wynik, x, y;
string wprow="wprowadz 2 liczby";
int main(){
do{
	cout<<"Jakiej metody chcesz u¿yæ?"<<endl;
	cout<<"1. B¹belkowej"<<endl;
	cout<<"2. Szybkiej"<<endl;
	cout<<"3. Przez wstawiaie"<<endl;
	cout<<"4. Przez wybór"<<endl;
	cout<<"0. wyjsc"<<endl;
	cin>>w;
	switch(w){
		case 1:
		cout<<wprow<<endl;
			cin>>x;
			cin>>y;
			wynik=dod(x,y);
			cout<<"wynik to "<<wynik<<endl;
			break;
		case 2:
		cout<<wprow<<endl;
			cin>>x;
			cin>>y;
			wynik=ode(x,y);
			cout<<"wynik to "<<wynik<<endl;
			break;
		case 3:
		cout<<wprow<<endl;
			cin>>x;
			cin>>y;
			wynik=mno(x,y);
			cout<<"wynik to "<<wynik<<endl;
			break;
		case 4:
		cout<<wprow<<endl;
			cin>>x;
			cin>>y;
			wynik=dzi(x,y);
			cout<<"wynik to "<<wynik<<endl;
			break;
		default:
		cout<<"Nie ma takiej opcji"<<endl;
		break;		
	}
}while(w!=0);
	cout<<"papatki ;)";

	
	
	
	
	return 0;
}
