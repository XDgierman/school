#include <iostream>
#include <cstdlib>
using namespace std;

void z01(int tab[]){
	for (int i=0; i<100; i++){
		if (tab[i]<=-1) tab[i]=0;
		else tab[i]=1;
	}
}

int main(){
	int t[100];
	for (int i=0;i<100;i++){
		t[i]=rand()%200-100;
		cout.width(4);
		cout<<t[i];
	}
	cout<<endl;
	z01(t);
	for (int i=0;i<100;i++){
		cout.width(4);
		cout<<t[i];
	}
}
