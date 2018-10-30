#include <iostream>  

using namespace std; 
 
string acronim (string a){
	string w="";
	w+=a[0];
	for (int i=1;i<=a.length();i++){
		if (a[i-1]==' ') {
			w+=a[i];
		}
	}
	return w;
}
 
int main(){ 
cout<<acronim("Zespol Szkol Tech");
}
