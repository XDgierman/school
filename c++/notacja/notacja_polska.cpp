#include <iostream>
using namespace std;

int main(){
	int tab[50];
	int index=0;
	char a;
	while(a!= '='){
		cin>>a;
		if(a>'0' && a<'9'){
			tab[index]=(int)a-48;
			index++;
		}
		else switch (a) {
			case '+':
			if (index-2<=-1){
				cout<<"Blad, za malo czynnikow"<<endl;
				break;
			}
			else tab[index-2]=tab[index-1]+tab[index-2];
			//cout<<tab[index-2]<<endl;
			index--;
			break;
			case '-':
			if (index-2<=-1){
				cout<<"Blad, za malo czynnikow"<<endl;
				break;
			}
			else tab[index-2]=tab[index-1]-tab[index-2];
			//cout<<tab[index-2]<<endl;
			index--;
			break;
			case '*':
			if (index-2<=-1){
				cout<<"Blad, za malo czynnikow"<<endl;
				break;
			}
			else tab[index-2]=tab[index-1]*tab[index-2];
			//cout<<tab[index-2]<<endl;
			index--;
			break;
			case '/':
			if (index-2<=-1){
				cout<<"Blad, za malo czynnikow"<<endl;
				break;
			}
			else if (tab[index-2]==0 || tab[index-1]==0){
				cout<<"Blad, dzielenie przez zero jest niedozwolone"<<endl;
				return -1;
			}
			else tab[index-2]=tab[index-1]/tab[index-2];
			//cout<<tab[index-2]<<endl;
			index--;
			break;
			case '=':
			cout<<"Koniec dzialania"<<endl;
			break;
			default:
			cout<<"Znak niedozwolony"<<endl;
			break;
		}
	}
	cout<<"Wynik wynosi = "<<tab[index-1]<<endl;
}
