#include <iostream>
#include <fstream>

using namespace std;

void sortowanie(int t[], int ile) 
{ 
   int i, x, j; 
   for (i = 1; i < ile; i++) 
   { 
       x = t[i]; 
       j = i-1; 
       while (j >= 0 && t[j] > x) 
       { 
           t[j+1] = t[j]; 
           j = j-1; 
       } 
       t[j+1] = x; 
   } 
} 
int main(){
	ifstream plik0;
	ofstream plik1;
	plik0.open("liczby50000.txt");
	plik1.open("sortowanie50000.txt");
	int ile=50000, t[50000];
	for (int i=0;i<ile;i++){
		int x;
		plik0>>x;
		t[i]=x;
	}
sortowanie(t,ile);
for (int i=0;i<ile;i++){
	plik1<<t[i]<<endl;
}
}
