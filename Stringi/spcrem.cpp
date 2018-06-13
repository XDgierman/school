#include <iostream>  

using namespace std; 
 
string spcrem (string a){
	string w="";

	for (int i=0;i<=a.length();i++){
		if (a[i-1]==' ') {
			i++;
		}
		else if (a[i]==' ' and a[i+1]==' '){
			i+=2;
	}
		w+=a[i];
	}
	return w;
}
 
int main(){ 
cout<<spcrem("Ala    ma    kota");
}
