#include <iostream>
#include <fstream>

using namespace std;


int main(){
	
ifstream plik;
plik.open("liczby1000.txt");
int t[500][2];
for (int i=0;i<500;i++){
	for (int j=0;j<2;j++){
		plik>>t[i][j];
	}
}
for (int i=0;i<500;i++){
	int tmp;
	tmp=t[i][0]+t[i][1];
	cout<<tmp<<endl;
}
}

