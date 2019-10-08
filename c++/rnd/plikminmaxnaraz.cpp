#include <iostream>
#include <fstream>

using namespace std;


int main(){

ifstream plik;
plik.open("liczby10000.txt");
int t[5000][2],ile[1002], b,i_max=-1, i_max_loc;
int min=99999999, max=-1;
for (int i=0;i<5000;i++){
	for (int j=0;j<2;j++){
		plik>>t[i][j];
	}
}
for (int i=0;i<1002;i++){
		ile[i]=0;
}
for (int i=0;i<10000;i++){
		plik>>b;
    ile[b]++;
}
for (int i=0;i<1002;i++){
		if (ile[i]>i_max){
      i_max=ile[i];
      i_max_loc=i;
    };
}
for (int i=0;i<5000;i++){
  if (t[i][0]<t[i][1]){
    if (t[i][0]<min){
      min=t[i][0];
    }
    if (t[i][1]>max){
      max=t[i][0];
    }
  }
  else {
    if (t[i][1]<min){
      min=t[i][1];
    }
    if (t[i][0]>max){
      max=t[i][0];
    }
  }
}
cout<<"min = "<<min<<endl;
cout<<"max = "<<max<<endl;
cout<<i_max_loc<<" x "<<i_max<<endl;
}
