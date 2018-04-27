#include <iostream>
using namespace std;

int main(){
	int i;
	float min=1000, max=-1, x;
	cout<<"Wprowadz 5 licz, a powiem ktora jest najmniejsza, a ktora najwieksza."<<endl;
for (i=0; i<5; i++){
	cin>>x;
	if (x<min) min=x;
	if (x>max) max=x;
}
cout<<"Najmniejsza liczba byla "<<min<<endl;
cout<<"Najwieksza liczba byla "<<max<<endl;

	return 0;
}
