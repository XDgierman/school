/*Napisz funkcjê cyfry zwracaj¹c¹ liczbê cyfr podanych jako parametr funkcji w liczbie podanej jako drugi parametr
np. wywo³anie funkcji cyfry(3,23537338) powinno zwróciæ 4, bo w podanej liczbie s¹ 4 trójki.
Wczytaj dane z pliku binarne1000.txt i wypisz wszystkie liczby które maj¹ wiêcej zer ni¿ jedynek.*/
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
	file.open("binarne1000.txt");
	string x;
	for (int i=0; i<1000;i++) {
	file>>x;
	if (cyfry(x,'0')>cyfry(x,'1')) {
		cout<<x<<"   "<<cyfry(x,'0')<<endl;
	};
}
}
