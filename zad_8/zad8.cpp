#include <iostream>
#include <fstream>
using namespace std;
int hasla(string haslo){
	int l=haslo.length();
	return l;
}
bool minmax(int licz){
	if (licz<10) return true;
	else return false;
	}
int main(){
ifstream plik1;
ofstream plik2;
ofstream plik3;
plik1.open("dane1000.txt");
plik2.open("krotkie.txt");
plik3.open("dlugie.txt");
string dane;
	for (int i=0;i<1000;i++){
		plik1>>dane;
		if (minmax(hasla(dane))) plik2<<dane<<endl;
		else plik3<<dane<<endl;
}
}

