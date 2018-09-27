#include <iostream> //showes the command line
#include <fstream> //allowes to use the files
using namespace std; // helps with not writing the std::int etc.
 int duo(int x[]){ //function that detects even numbers
   int zwei=0;
   for (int i=0; i<1000; i++){
   if (x[i]%2==0) zwei++;  //tests all the numbers if they are even, and counts them
 }
 return zwei; //all counted numbers come back to main function
 }



 int main(){ // main function
   int x[1000], min=1000, minloc, max=-1, maxloc; //variables
   ifstream file; // making the variable for opening the files
   file.open("cyfry.txt"); //variable opens the file with numbers
   for (int i=0; i<1000; i++){
     file>>x[i]; //variable enters the numbers into an array
   };
   for (int i=0; i<1000; i++){
     int z=0, y;
     y=x[i];
     while(y!=0){ //this function is adding the numbers, like 12 is 1+2=3, 456 is 4+5+6=15 etc.
       z+=y%10;
       y/=10;
     };
     if (z<min){
       min=z; //checks the number if its the lowest sum
       minloc=i; // saves the position in array of lowest sum
     };
     if (z>max){
       max=z; //same as higher, but with the biggest
       maxloc=i;
     };
   };
   cout<<duo(x)<<endl; //writes how many of even numbers are in array
   cout<<"max= "<<max<<" and the number is "<<x[maxloc]<<endl; // showes the sum of biggest number and the number itselve
   cout<<"min= "<<min<<" and the number is "<<x[minloc]<<endl; // same as up but with the smallest sum
   return 0; //end of program
 }
