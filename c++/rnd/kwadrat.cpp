/*ogólna postaæ funkcji
typ zwracanej wartoœci nazwa(lista parametrów formalnych){
}
np. int dodaj(int a, int b){
}
uwaga! je¿eli funkcja nie zwraca ¿adnej wartoœci to jako typ wpisujemy void
wywo³anie funkcji wymaga podania parametrów aktualnych w tej samej iloœci i
kolejnoœci co w deklaracji
ka¿da funkcja powinna mieæ unikaln¹ nazwê, sk³adaj¹c¹ siê z liter, cyfr i znaków
podkreœlenia. Mo¿na u¿yæ tej samej nazwy wielokrotnie je¿eli funkcje ró¿ni¹ siê
list¹ parametrów - przeci¹¿anie funkcji */
#include <iostream>

using namespace std;

void square(int x, int y);

int main(){
	int x,y;
	cout<<"podaj wymiary prostokata"<<endl;
	cin>>x;
	cin>>y;
	square(x,y);
	
	
}

void square(int x, int y){
	for(int i=0;i<y;i++){
		cout<<'-';
	}
	cout<<endl;
	for(int i=1;i<x-1;i++){
		cout<<'|';
		for(int l=1;l<y-1;l++){
			cout<<' ';
		}
		cout<<'|'<<endl;
	}	
	for(int i=0;i<y;i++){
		cout<<'-';
}
}
