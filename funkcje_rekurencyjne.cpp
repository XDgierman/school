#include <iostream>
using namespace std;

int fun(int f, int s){
if (f==s) return f;
do{
	if (f>s) f=f-s;
	else s=s-f;
}while (f!=s);
return f;
}

int fun2(int f, int s){
if (f==s) return f;
if (f>s) return fun2(f-s,s);
else return fun2(f,s-f);
}

int main(){
cout<<fun(80,60)<<endl;
cout<<fun2(96,120)<<endl;
cout<<fun(60,80)<<endl;
cout<<fun2(120,96);
}
