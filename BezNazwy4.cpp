#include <iostream>
using namespace std;

int main(){
	int a;
	float b;
	char c;
	bool d;
	string e;
	
	cout<<"Podaj liczbe calkowita"<<endl;
	cin>>a;
	cout<<"Podaj liczbê rzeczywista"<<endl;
	cin>>b;
	cout<<"Wpisz dowolny znak"<<endl;
	cin>>c;
	cout<<"Wpisz true lub false"<<endl;
	cin>>d;
	cout<<"Wpisz zdanie (z mostkami)"<<endl;
	cin.get();
	cin>>e;
	cin.get();
	cin.get();
	cout<<"Twoja liczba calkowita to "<<a<<endl;
	cout<<"Rzeczywista: "<<b<<endl;
	cout<<"Znak: "<<c<<endl;
	cout<<"Bool: "<<d<<endl;
	cout<<"I zdanie: "<<e<<endl;
	
	
	
	return 0;
}
