#include <iostream>
#include <fstream>
using namespace std;
int StrToInt(string a){
	int x=(int)a[0]-48;
	for (int i=1; i<=a.length()-1;i++){
		x=x*10+a[i]-48;
	}
	return x;
}
int Sum(int a){
	int b, c=0;
	do{
	b=a%10;
	c=c+b;
	a=a/10;
}while (a>0);
return c;
}
int main(){
	ifstream file;
	file.open("liczby10000.txt");
	string x;
	int t[10000],ax[1000], in[1000], j=0,k=0, min=1000, max=0;
	for (int i=0; i<10000; i++){
		file>>x;
		t[i]=StrToInt(x);
	}
	for (int i=0; i<10000; i++){
		if (Sum(t[i])==max) {
			ax[j]=t[i];
			//cout<<ax[j]<<endl;
			j++;
		}
		else if (Sum(t[i])>max){
			max=Sum(t[i]);
			j=0;
			ax[j]=t[i];
			//cout<<ax[j]<<endl;
			j++;
		}
		else if (Sum(t[i])==min) {
			in[k]=t[i];
			//cout<<in[k]<<endl;
			k++;
		}
		else if (Sum(t[i])<min){
			min=Sum(t[i]);
			k=0;
			in[k]=t[i];
			//cout<<in[k]<<endl;
			k++;
		}
	}
	cout<<"najmniejsze sumy liczb :"<<endl;
	for (int i=0; i<k;i++){
		cout<<in[i]<<endl;
	}
	cout<<"najwieksze sumy liczb :"<<endl;
	for (int i=0; i<j;i++){
		cout<<ax[i]<<endl;
	}	
}
