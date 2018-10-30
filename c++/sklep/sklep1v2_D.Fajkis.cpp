#include <iostream>
#include <fstream>
using namespace std;
//Do wykonania: Rozbudowaæ system zakupu; dodaæ rachunek; (opcjonalne)dodaæ iloœæ pieniêdzy na wejœcie

struct sklep{
	string nazwa;
	int ilosc;
	float cena;
};
//wczytanie danych
int wczytaj(sklep t[]) {
ifstream plik;
plik.open("towary2.txt");
int i=0;
while (plik){
	plik>>t[i].nazwa;	
	plik>>t[i].ilosc;
	plik>>t[i].cena;
	i++;	
}
return i;
}
//wyœwietlenie danych
void wyswietl(sklep t[], int ile){
	for (int i=0;i<ile;i++){
		cout.width(20);
		cout<<t[i].nazwa;
		cout.width(5);
		cout<<t[i].ilosc;
		cout.width(10);
		cout<<t[i].cena<<endl;
		
	}
}
//zakupy
float zakup(sklep t[], int ile){
	string z;
	int m;
	int pozycja=-1;
	float wartosc;
	cout<<"co chcesz kupic? ";
	cin>>z;
	for (int i=0;i<ile; i++){
		if (z==t[i].nazwa) pozycja=i;
	}
	
	if (pozycja<0) {
		cout<<"BRAK TOWARU"<<endl;
		return -1;
	}
	else {
		cout<<"ile chcesz zakupic? ";
		cin>>m;
		if (t[pozycja].ilosc<m){
			cout<<"NIE MA TYLE TOWARU"<<endl;
			return -1;
		}
		else{
		cout<<t[pozycja].nazwa<<" cena "<<t[pozycja].cena<<"ile "<<m<<endl;
		wartosc=m*t[pozycja].cena;
		t[pozycja].ilosc=t[pozycja].ilosc-m;
		return wartosc ;
		
		}
	
	}
}


int main(){
	sklep t[12];
	int n,o;
	n=wczytaj(t);
	n--;
	do{
	wyswietl (t,n);
	float w=zakup(t,n);
	if (w>0) cout<<"do zaplaty :" <<w<<endl;
		cout<<"czy jeszcze chesz coœ kupic?"<<endl;
		cout<<"jesli tak wpisz 1, jesli nie wpisz 2"<<endl;
		cin>>o;
}while(o!=2);
}

