//wylosuj do tablcy 10 liczb z przedzia³u od -99 do 99,
//pytaj u¿ytkownika, który element mu wyœwietliæ,
//zakoñcz gdy poda index spoza zakresu tablicy
#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i;
	short int x[10];
	srand(time(NULL));
	for(i=1;i<11;i++){
		x[i]=rand()%199-99;
		cout.width(4);
		cout<<x[i];
	}
	cout<<endl;
	cout<<"Jaka liczbe wyswietlic?"<<endl;
	cin>>i;
	if (i>=11||i<=0){
		cout<<"Nie ma liczby w tablicy"<<endl;
		return 0;
	}
	else {
		cout<<"Pod tym miejscem w tablicy znajduje sie liczba "<<x[i]<<endl;
		return 0;
	}
	
	
}
