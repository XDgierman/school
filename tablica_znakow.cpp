/*utwórz tablicê dla zmiennych znakowych
i wylosuj do niej 100 znaków
utwó¿ tablice litery, cyfry, inne znaki
przepisz wylosowane znaki do odpowiednich tablic,
wyœwietl ka¿d¹ z tablic*/
#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i,x[100],zl=0,zc=0,zz=0;
	char e[100],l[100],c[100],z[100];
	srand(time(NULL));
	for(i=0;i<100;i++){
		x[i]=rand()%95+33;
		e[i]=(char)x[i];
		cout.width(4);
		cout<<e[i];
		if (((e[i]>='a')&(e[i]<='z'))|((e[i]>='A')&(e[i]<='Z'))) {
			l[zl]=e[i];
			zl++;
		}
		else if ((e[i]>='0')&(e[i]<='9')) {
			c[zc]=e[i];
			zc++;
		}
		else {
			z[zz]=e[i];
			zz++;
		}
	}
	cout<<"Tablica liter"<<endl;
	for(i=0;i<zl;i++){
		cout.width(4);
		cout<<l[i];
	}
	cout<<endl;
	cout<<"Tablica cyfer"<<endl;
	for(i=0;i<zc;i++){
		cout.width(4);
		cout<<c[i];
	}
	cout<<endl;	
	cout<<"Tablica znakow"<<endl;
	for(i=0;i<zz;i++){
		cout.width(4);
		cout<<z[i];
	}		

	
	
}
