/* wylosuj do tablicy 20 liczb z przedzia³u od -99 do 99,
wyœwietl je. utwórz menu zawieraj¹ce nastêpuj¹ce pozycje
1. Minimalna
2. Maxymalna
3. Œrednia
4. ZnajdŸ liczbê [trudne]
5. Ile dodatnich
6. Ile parzystych
0. Wyjœcie z programu
*/
#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i,a,min,z,dd;
	float sr;
	short int x[20];
	srand(time(NULL));
	for(i=0;i<20;i++){
		x[i]=rand()%199-99;
		cout.width(4);
		cout<<x[i];
	}
	do {
		cout<<"Wybierz opcje"<<endl;
		cout<<"1. Minimalna"<<endl;
		cout<<"2. Maksymalna"<<endl;
		cout<<"3. Srednia"<<endl;
		cout<<"4. Znajdz liczbe"<<endl;
		cout<<"5. Liczba dodanich"<<endl;
		cout<<"6. Ile parzystych"<<endl;
		cout<<"0. Wyjscie z programu"<<endl;
		cin>>a;
		switch (a){
			case 0:
				cout<<"Papatki ;D"<<endl;
				break;
			case 1:
				min=x[0];
				for(z=1;z<20;z++){
					if (min>x[z])
					min=x[z];
				}
				cout<<"Minimalna liczba to "<<min<<endl;
				break;
			case 2:
				min=x[0];
				for(z=1;z<20;z++){
					if (min<x[z])
					min=x[z];
				}
				cout<<"Maksymalna liczba to "<<min<<endl;
				break;
			case 3:
				min=x[0];
				for(z=1;z<20;z++){
					min=min+x[z];
				}
				sr=min/20.0;
				cout<<"Srednia wszystkich liczb wynosi "<<sr<<endl;
				break;
			case 4:
				cout<<"Ta opcja jest nieukonczona"<<endl;
				cout<<"Przepraszamy za niedogodnoœci"<<endl;
				/* TODO (Filip#1#): dorobiæ opcjê */
				break;
			case 5:
				i=0;
				for(z=0;z<20;z++){
					if(x[z]>0) i++;
				}
				cout<<"Jest "<<i<<" liczb dodatnich"<<endl;
				break;
			case 6:
				/* TODO (Filip#1#): Dorobiæ opcjê */	
				break;
			default:
				cout<<"Nie ma takiej opcji w menu"<<endl;
				break;
		}
	}
	while (a!=0);
}
	
