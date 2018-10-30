#include <iostream>
#include <fstream>

using namespace std;

int main(){
ifstream plik0;
ofstream plik1;
plik0.open("liczby1000.txt");
plik1.open("sortowanie1000.txt");
int  l=0, t[l];
int min=t[l];
}
void sortowanie(int t[], int ile){
int l=0, n, min, tmp, i;
while(l<ile-1){

min=999999;
for(int i=l;i<ile;i++){
	if(t[i]<min){
		min=t[i];
		n=i;
	}
}
tmp=t[l];
t[l]=t[n];
t[n]=tmp;
l++;
wyœwietl(t;ile)
cin.get();
}
}
