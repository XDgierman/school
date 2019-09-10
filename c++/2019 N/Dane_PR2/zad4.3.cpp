#include <iostream>
#include <fstream>
using namespace std;

int nwd(int x, int y){
    while (x!=y){
        if (x>y) x-=y;
        else y-=x;
    }
    return x;
}


int main(){
    ifstream file;
    file.open("liczby.txt");
    int x,tab[500],val,len,gre;
    int eval,elen=0,egre;
    for(int i=0;i<500;i++){
        file>>x;
        tab[i]=x;
    }
    val=tab[0];
    gre=tab[0];
    len=1;
    for (int j = 1; j < 500; j++)
    {
        if (nwd(gre,tab[j])==1)
        {
            if(len>elen){
                eval=val;
                elen=len;
                egre=gre;
                //cout<<eval<<endl;
            }
            
            val=tab[j-1];
            //cout<<val<<endl;
            gre=nwd(tab[j-1],tab[j]);
            len=2;
            //p++;
        } else
        {
            gre=nwd(gre,tab[j]);
            len++;
        } 
    }
    if(len>elen){
                eval=val;
                elen=len;
                egre=gre;
    }
    cout<<eval<<", "<<elen<<", "<<egre<<endl;
    return 0;
}
