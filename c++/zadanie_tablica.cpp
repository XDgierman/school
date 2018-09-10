#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(){
	int i,tmp,a,l,p;
	short int x[10];
	srand(time(NULL));
	for(i=1;i<11;i++){
		x[i]=rand()%199-99;
		cout.width(4);
		cout<<x[i];
	}
	cout<<endl;
	do {
		cout<<"Co chcesz teraz zrobic?"<<endl;
		cout<<"1. Zobaczyc liczbe w tabeli"<<endl;
		cout<<"2. Przemiescic liczby w tabeli"<<endl;
		cout<<"3. Wyjsc z programu"<<endl;
		cin>>a;
			if (a=1){
				cout<<"Jaka liczbe wyswietlic?"<<endl;
				cin>>i;
				if (i>=11||i<=0){
					cout<<"Nie ma liczby w tablicy"<<endl;
					return 0;
}
		else {
			cout<<"Pod tym miejscem w tablicy znajduje sie liczba "<<x[i]<<endl;
}}
	if(a=2){
		cout<<"Podaj pierwsza i drugi index"<<endl;
			if (l>0 & l<10 & p>0 & p<10){
				cin>>i>>p;
				tmp=x[i];
				x[i]=x[p];
				x[p]=tmp;
}
					for(i=1;i<11;i++){
						cout.width(4);
						cout<<x[i];
}}
}while (a=3);
	cout<<"Pa pa ;D"<<endl;
return 0;
}
