
#include <iostream>
#include <cstdlib>
using namespace std;


void sortuj(int tab[], int l, int p)
{
int i,j,sr,s,temp;
i=l;
j=p;
s=(l+p)/2;
sr=tab[s];
do
{
	while (tab[i]<sr) i++;
	
	while (sr<tab[j]) j--;
	
	if (i<=j)
		{
			temp=tab[i];
			tab[i]=tab[j];
			tab[j]=temp;
			i++;
			j--;
		}
}
while (i<=j);
if (l<j) sortuj(tab,l,j);
if (i<p) sortuj(tab,i,p);
}



 int main(){
 	int i, tab[100];
for (i=0;i<100;i++){
	tab[i]=rand()%100;
	cout.width(4);
	cout<<tab[i];
}
cout<<endl;
sortuj(tab,0,99);
 cout<<"posortowane "<<endl;
 for (i=0;i<100;i++){
	
	cout.width(4);
	cout<<tab[i];
}

	}
	
	


 


