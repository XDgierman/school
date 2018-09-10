/*wyszukiwanie liczb pierwszych
1. utwórz tablicê typu 'bool' o 'n' elementach (n-wartoœæ do której szukamy
liczb pierwszych), wszystkim elementom przypisz wartoœæ 'true'
2. ustwaw wartoœæ 'p' na 2
3. rozpoczynaj¹c od 2'p' co 'p' wpisuj do tablicy 'false'
4. zwiêksz 'p' o jeden i powtarzaj krok 3 dopóki 'p'<=pierwiastek z 'n'
5. wyœwietl liczby pierwsze z podanego przedzia³u
*8. wyœwietl liczby od 10000 do 100000 liczb pierwszych*/
#include <iostream>
#include <math.h>
using namespace std;

int main(){
	int n, p=2;
	bool z[n];
	cout<<"ile ma byc liczb pierwszych?"<<endl;
	cin>>n;
	for (int i=1;i<n+1;i++){
		z[i]=true;
	}
	while (p<=sqrt(n)){
		for (int i=2;i<=n;i++){
			z[i*p]=false;
		}
		p++;
	}
	for (int i=1;i<n+1;i++){
		if (z[i]=true) cout<<i<<" jest liczba pierwsza"<<endl;
	}
	return 0;
}
