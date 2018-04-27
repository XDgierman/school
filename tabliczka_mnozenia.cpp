/*deklaracja tablicy 2 wymiarowej
typ nazwa [liczba kolumn][liczba wierszy]
zrobiæ tabliczkê mno¿enia*/
#include <iostream>

using namespace std;

int main(){
	int m[16][21],x,y;
	for (y=1;y<21;y++){
		for (x=1;x<16;x++){
			m[x][y]=x*y;
		}
	}
	for (y=1;y<21;y++){
		for (x=1;x<16;x++){
			cout.width(5);
			cout<<m[x][y];
		}
		cout<<endl;
}
	
	
	
}
