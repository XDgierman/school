#include <iostream>  

using namespace std; 
 
bool panindrom (string a){
	string w="";
	for (int i=a.length();i>=0;i--){
	
	w+=a[i];
	}
	for (int i=0; i<=a.length();i++){
	if (a[i]!=w[i]){
	return false;	
	}
	}
	return true;
}
 
int main(){ 
cout<<panindrom("kajak");
}
