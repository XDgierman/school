/*og�lna posta� funkcji
typ zwracanej warto�ci nazwa(lista parametr�w formalnych){
}
np. int dodaj(int a, int b){
}
uwaga! je�eli funkcja nie zwraca �adnej warto�ci to jako typ wpisujemy void
wywo�anie funkcji wymaga podania parametr�w aktualnych w tej samej ilo�ci i
kolejno�ci co w deklaracji
ka�da funkcja powinna mie� unikaln� nazw�, sk�adaj�c� si� z liter, cyfr i znak�w
podkre�lenia. Mo�na u�y� tej samej nazwy wielokrotnie je�eli funkcje r�ni� si�
list� parametr�w - przeci��anie funkcji */
#include <iostream>

using namespace std;

void square(int x, int y);

int main(){
	int x,y;
	cout<<"podaj wymiary prostokata"<<endl;
	cin>>x;
	cin>>y;
	square(x,y);
	
	
}

void square(int x, int y){
	for(int i=0;i<y;i++){
		cout<<'-';
	}
	cout<<endl;
	for(int i=1;i<x-1;i++){
		cout<<'|';
		for(int l=1;l<y-1;l++){
			cout<<' ';
		}
		cout<<'|'<<endl;
	}	
	for(int i=0;i<y;i++){
		cout<<'-';
}
}
