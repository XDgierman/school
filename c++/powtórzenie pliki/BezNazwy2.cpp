#include <iostream>
#include <fstream>
using namespace std;

bool minmax(int licz){
	if (licz<100000) return true;
	else return false;
	}
int main(){
	ifstream plik;
	plik.open("liczby5000.txt");
	int liczba;
	for (int i=0;i<5000;i++){
		plik>>liczba;
		if (minmax(liczba)) cout<<liczba<<endl;
	}
}
