#include <iostream>  

using namespace std; 
 
string sufix (string a,int p){
	string w="";
	for (int i=a.length()-p;i<=a.length();i++){
		w+=a[i];
	}
	return w;
}
 
int main(){ 
cout<<sufix("ABCDEFGH",3);
}
