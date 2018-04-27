#include <iostream>
#include <fstream>
using namespace std;

int main(){
	ifstream file;
	file.open("liczby10000.txt");
	int number[10000], test[1000];
	int max=-1, loc;
	for (int j=0;j<1000;j++){
		test[j]=0;	
			for (int i=0;i<10000;i++){
				file>>number[i];
				if (number[i]==j) test[j]++;
			}
		//cout<<j<<" = "<<test[j]<<endl;
		if (test[j]>max) {
			max=test[j];
			loc=j;
		}
	}
	cout<<loc<<" x "<<max<<endl;	
}
