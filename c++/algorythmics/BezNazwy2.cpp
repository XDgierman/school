/*Napisz funkcj� cyfry zwracaj�c� liczb� cyfr podanych jako parametr funkcji w liczbie podanej jako drugi parametr
np. wywo�anie funkcji cyfry(3,23537338) powinno zwr�ci� 4, bo w podanej liczbie s� 4 tr�jki.
Wczytaj dane z pliku binarne1000.txt i wypisz wszystkie liczby kt�re maj� wi�cej zer ni� jedynek.*/
#include <iostream>
#include <fstream>
using namespace std;
int cyfry(string a, char b){
	int x=0, z=0;
	for (int j=0;j<a.length();j++){
		if (a[j]==b) z++;
		
	}
	return z;
	}

int main(){

	ifstream file;
	file.open("liczby5000.txt");
	string x;
	for (int i=0; i<5000;i++) {
	file>>x;
	if (cyfry(x,'5')>=3) {
		cout<<x<<"   "<<cyfry(x,'5')<<endl;
	};
}
}
