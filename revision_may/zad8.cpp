#include <iostream>
//ai=(2*ai-1-3)/3, 
using namespace std;


float iteracja(int x){
	float a=10;
	for (int i=2;i<=x;i++){
		a=(2*a-3)/3.0;
	}
	return a;
}


float rekurencja(int x){
	if (x==1 ) return 10;
	else return (2*rekurencja(x-1)-3)/3.0;
}

int main(){
int i=1;
cout<<"iteracyjnie"<<endl;
while (iteracja(i)>0){
	cout<<i<<": "<<iteracja(i)<<endl;
	i++;
}
i=1;
cout<<"rekurencyjnie"<<endl;
while (rekurencja(i)>0){
	cout<<i<<": "<<rekurencja(i)<<endl;
	i++;
}
}
