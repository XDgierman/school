#include <iostream>
#include <fstream>

using namespace std;

bool minmax(int licz){
	if (licz<500) return true;
	else return false;
	}
int main(){
	
ifstream plik1;
ofstream plik2;
ofstream plik3;
plik1.open("liczby1000.txt");
plik2.open("mniejsze.txt");
plik3.open("wieksze.txt");
int liczba;
for (int i=0;i<1000;i++){
		plik1>>liczba;
		if (minmax(liczba)) plik2<<liczba<<endl;
		else plik3<<liczba<<endl;
}
}

