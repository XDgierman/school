#include <iostream>  

using namespace std; 
 
string prefix (string a,int p){
	string w="";
	for (int i=0;i<=p;i++){
		w+=a[i];
	}
	return w;
}
 
int main(){ 
cout<<prefix("ABCDEFGH",3);
}
