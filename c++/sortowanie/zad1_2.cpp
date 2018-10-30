#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;



void wyswietl (int t[],int n){
for (int i=0;i<n;i++){
	
	cout.width(4);
	cout<<t[i];
	
}	
cout<<endl;	
}



void sortowanie(int t[], int ile){
	int l=0,m,i,min,tmp;
	
while (l<ile-1)
{	
	min=999999;
	for (i=l;i<ile;i++){
		if (t[i]<min){
			min=t[i];
			m=i;
		}
	}
		tmp=t[l];
		t[l]=t[m];
		t[m]=tmp;
	l++;
	wyswietl(t,ile);
	cin.get();
}
}


int main()
{
srand(time(NULL));
int ile=20;
int t[ile];
for (int i=0;i<ile;i++){
	t[i]=rand()%100;

}	
cout<<endl;
sortowanie(t,ile);
wyswietl(t,ile);

		
}
