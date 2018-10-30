#include <iostream>
#include <fstream>
using namespace std;
//Do wykonania: Rozbudowaæ system zakupu; dodaæ rachunek; (opcjonalne)dodaæ iloœæ pieniêdzy na wejœcie
float m;
struct sklep{
	string nazwa;
	int ilosc;
	float cena;
};
//wczytanie danych
int wczytaj(sklep t[]) {
ifstream plik;
plik.open("towary2.txt")	;
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
	
	int v;
	int pozycja=-1;
	int ilosc=v;
	float wartosc;
	cout<<"co chcesz kupic? ";
	cin>>z;
	cout<<"ile chcesz zakupic? ";
	cin>>m;
	if(m>ilosc){
	cout<<"nie mamy dosc towaru"<<endl;
	return 0;
}
	else{
	
	for (int i=0;i<ile; i++){
		if (z==t[i].nazwa) pozycja=i;
	}
	
	if (pozycja<0) {
		cout<<"BRAK TOWARU"<<endl;
		return -1;
	}
	else {
		cout<<pozycja<<" cena "<<t[pozycja].cena<<"ile "<<m<<endl;
		wartosc=m*t[pozycja].cena;
		return wartosc ;
	}
}
}

int main(){
	sklep t[12];
	int n;
	n=wczytaj(t);
	n--;
	wyswietl (t,n);
	float w=zakup(t,n);
	if (w>0) cout<<"do zaplaty :" <<w<<endl;

}

