#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

void el(int t[], int l, int p){
	int tmp=t[l-1];
	t[l-1]=t[p-1];
	t[p-1]=tmp;
}

int main(){
srand(time(NULL));
int tab[100],i,x,y;
for (i=0;i<100;i++){
	tab[i]=rand()%100;
	cout.width(4);
	cout<<tab[i];
}
cout<<"Ktore elementy zamienic?"<<endl;
cin>>x;
cin>>y;
el(tab,x,y);
cout<<endl;
for (i=0;i<100;i++){
	cout.width(4);
	cout<<tab[i];
}
}
