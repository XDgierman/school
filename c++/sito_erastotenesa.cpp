/*wyszukiwanie liczb pierwszych
1. utw?rz tablic? typu 'bool' o 'n' elementach (n-warto?? do kt?rej szukamy
liczb pierwszych), wszystkim elementom przypisz warto?? 'true'
2. ustwaw warto?? 'p' na 2
3. rozpoczynaj?c od 2'p' co 'p' wpisuj do tablicy 'false'
4. zwi?ksz 'p' o jeden i powtarzaj krok 3 dop?ki 'p'<=pierwiastek z 'n'
5. wy?wietl liczby pierwsze z podanego przedzia?u
*8. wy?wietl liczby od 10000 do 100000 liczb pierwszych*/
#include <iostream>
#include <math.h>
using namespace std;

bool czy_pierwsza(int x){
	if (x%2==0) return false;
	int dz=3;
	while (dz<=sqrt(x)){
		if (x%dz==0){
			return false;
		}
		else dz++;
	}
	return true;
}
void sito(bool tab[],int n){
	int p=2;
	do{
		for (int i=2*p;i<n;i+=p){
				tab[i]=false;
			}
			p++;
		}while (p<=sqrt(n));
}
int main(){
	int n, p=2;
	bool z[n];
	cout<<"ile ma byc liczb pierwszych?"<<endl;
	cin>>n;
	for (int i=2;i<n;i++){
		z[i]=true;
	}
	sito(z,n);
	for (int i=2;i<n;i++){
		if (z[i]==true) cout<<i<<" jest liczba pierwsza"<<endl;
	}
	return 0;
}
