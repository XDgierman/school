#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

int main(){
	int x1,x2,y1,y2;
	float a,b,c,cc,x0,y0,p,mino=9999,maxo=-1,minp=9999,maxp=-1;
	ifstream file;
	file.open("wsp1000.txt");
	for (int i=0; i<1000; i++){
		file>>x1;
		file>>y1;
		file>>x2;
		file>>y2;
		if(x1!=x2){
			if(y1!=y2){
				a=(float)(y2-y1)/(x2-x1);
				b=(float)y1-(a*x1);
				x0=-(b/a);
				y0=b;
				if (x0<=0){
					x0=-x0;
				}
				if (y0<=0){
					y0=-y0;
				}
				c=sqrt((x0*x0)+(y0*y0));
				cc=x0+y0+c;
				p=(x0*y0)/2;
				if (cc < mino && cc!=0){
					mino=cc;
				}
				if (cc > maxo){
					maxo=cc;
				}
				if (p < minp && p!=0){
					minp=p;
				}
				if (p > maxp){
					maxp=p;
				}
			}
		}
	}
	cout<<"min p: "<<minp<<endl<<"max p: "<<maxp<<endl<<"min o: "<<mino<<endl<<"max o: "<<maxo<<endl;
	return 0;
}
