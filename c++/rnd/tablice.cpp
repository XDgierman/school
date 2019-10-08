//tablice jednowymiarowe
//funkcja rand s�u�y do generowania liczb losowych
//nale�y ona do biblioteki <cstdlib>
//x=rand();  [x ma by� int][rand to liczba ca�kowita nieujemna]
//x=rand()%10; - ograniczenie zakresu losowania od 0 do 9
//10 99
//rand()%90+10; zakres <10;99>
//-100 100
//rand()%201-100; zakres <-100;100>
//og�lnie
//rand()%(zg-zd+1)+zd; zakres <zd;zg>
//funkcja srand(time(NULL)) pobiera czas z zegara systemowego, dzi�ki temu
//ka�de uruchomienie generuje inne waro�ci dla funkcji rand
//UWAGA potrzebna biblioteka <ctime>
//
//
//
//DEKLARACJA TABLICY JEDNOWYMIAROWEJ
//typ nazwa[rozmiar]
//np:
//int x[20];
//odwo�anie do elementu tablicy
//nazwa[indeks]
//np:
//x[i], x[5]
//UWAGA nie wolno przekracza� zakresu tablicy
//zadanie
//wylosuj do tablcy 10 liczb z przedzia�u od -99 do 99,
//wy�wietl je. wy�wietl je nast�pnie w odwrotnej kolejno�ci
#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i;
	short int x[i];
	srand(time(NULL));
	for(i=0;i<10;i++){
		x[i]=rand()%199-99;
		cout.width(4);
		cout<<x[i];
	}
	cout<<endl;
	for(i=9;i>-1;i--){
		cout.width(4);
		cout<<x[i];
	}
	
	
}
