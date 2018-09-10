/* zadeklaruj tablice o wymiarach 4*8
wype³nij j¹ liczbami parzystymi od 10*/
#include <iostream>

using namespace std;

int main(){
	int m[4][8],x,y,l=10;
		for (y=0;y<8;y++){
			for (x=0;x<4;x++){
			m[x][y]=l;
			l=l+2;
		}
	}
	for (y=0;y<8;y++){
		for (x=0;x<4;x++){
			cout.width(4);
			cout<<m[x][y];
	}
	cout<<endl;
}
cout<<endl;
cout<<endl;
	for (y=7;y>-1;y--){
		for (x=3;x>-1;x--){
			cout.width(4);
			cout<<m[x][y];
	}
		cout<<endl;
}
cout<<endl;
cout<<endl;
	for (y=7;y>-1;y--){
		for (x=0;x<4;x++){
			cout.width(4);
			cout<<m[x][y];
	}
		cout<<endl;
}
cout<<endl;
cout<<endl;
	for (y=0;y<8;y++){
		for (x=3;x>-1;x--){
			cout.width(4);
			cout<<m[x][y];
	}
	cout<<endl;
}




}

