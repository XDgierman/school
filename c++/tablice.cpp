//tablice jednowymiarowe
//funkcja rand s³u¿y do generowania liczb losowych
//nale¿y ona do biblioteki <cstdlib>
//x=rand();  [x ma byæ int][rand to liczba ca³kowita nieujemna]
//x=rand()%10; - ograniczenie zakresu losowania od 0 do 9
//10 99
//rand()%90+10; zakres <10;99>
//-100 100
//rand()%201-100; zakres <-100;100>
//ogólnie
//rand()%(zg-zd+1)+zd; zakres <zd;zg>
//funkcja srand(time(NULL)) pobiera czas z zegara systemowego, dziêki temu
//ka¿de uruchomienie generuje inne waroœci dla funkcji rand
//UWAGA potrzebna biblioteka <ctime>
//
//
//
//DEKLARACJA TABLICY JEDNOWYMIAROWEJ
//typ nazwa[rozmiar]
//np:
//int x[20];
//odwo³anie do elementu tablicy
//nazwa[indeks]
//np:
//x[i], x[5]
//UWAGA nie wolno przekraczaæ zakresu tablicy
//zadanie
//wylosuj do tablcy 10 liczb z przedzia³u od -99 do 99,
//wyœwietl je. wyœwietl je nastêpnie w odwrotnej kolejnoœci
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
