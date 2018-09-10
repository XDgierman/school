#include <iostream>
#include <fstream>
using namespace std;
 int duo(int x[]){
   int zwei=0;
   for (int i=0; i<1000; i++){
   if (x[i]%2==0) zwei++;
 }
 return zwei;
 }



 int main(){
   int x[1000], min=1000, minloc, max=-1, maxloc;
   ifstream file;
   file.open("cyfry.txt");
   for (int i=0; i<1000; i++){
     file>>x[i];
   };
   for (int i=0; i<1000; i++){
     int z=0, y;
     y=x[i];
     while(y!=0){
       z+=y%10;
       y/=10;
     };
     if (z<min){
       min=z;
       minloc=i;
     };
     if (z>max){
       max=z;
       maxloc=i;
     };
   };
   cout<<duo(x)<<endl;
   cout<<"max= "<<max<<" and the number is "<<x[maxloc]<<endl;
   cout<<"min= "<<min<<" and the number is "<<x[minloc]<<endl;
   return 0;
 }
