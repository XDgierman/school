#include <iostream>
#include <fstream>
using namespace std;
int hasla(string haslo){
	int l=haslo.length();
	return l;
}
int main(){
ifstream plik1;
ofstream plik2;
plik1.open("hasla200.txt");
plik2.open("wynik.txt");
string haslo;
	for (int i=0; i<200;i++){
		plik1>>haslo;
		plik2<<haslo<<" "<<hasla(haslo)<<endl;
	}
}
