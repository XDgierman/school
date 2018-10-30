#include <iostream>  

using namespace std; 
 
bool palindrom (string a){
	string w="";
	for (int i=a.length()-1;i>=0;i--){
	
	w+=a[i];
	}
	for (int i=0; i<=a.length();i++){
		cout<<a[i]<<"  "<<w[i]<<endl;
	if (a[i]!=w[i]){
	return false;	
	}
	}
	return true;
}
 
int main(){ 
if (palindrom("kajak")) {cout<<"Tak";
}
else {cout<<"Nie";
}
}
