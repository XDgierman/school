#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

int main(){
	int x1,x2,y1,y2;
	float a,b,c,cx,cn,x0,y0,tmpx,tmpy,p,minp=9999,maxp=-1;
	ifstream file;
	file.open("trojkaty10000.txt");
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
				tmpx=x0;
				tmpy=y0;
				if (x0<=0){
					x0=-x0;
				}
				if (y0<=0){
					y0=-y0;
				}
				c=sqrt((x0*x0)+(y0*y0));
				p=(x0*y0)/2;
				if (p < minp && p!=0){
					minp=p;
					//cout<<minp<<endl;
					if (tmpx >=0 && tmpy >=0) {
							if (a < 0 && b > 0 && a>=tmpx && b<tmpy){
								minp=p;
								cx=1;
							}
					} else if (tmpx <0 && tmpy >=0) {
							if (a > 0 && b < 0 && a<tmpx && b>=tmpy){
								minp=p;
								cx=2;
							}
					} else if (tmpx <0 && tmpy <0) {
							if (a < 0 && b < 0 && a>=tmpx && b>=tmpy){
								minp=p;
								cx=3;
							}
					} else {
							if (a > 0 && b > 0 && a<tmpx && b<tmpy){
								minp=p;
								cx=4;
							}
					}
				}
				}
				if (p > maxp){
					if (tmpx >=0 && tmpy >=0) {
							if (a < 0 && b > 0 && a>=tmpx && b<tmpy){
								maxp=p;
								cn=1;
							}
					} else if (tmpx <0 && tmpy >=0) {
							if (a > 0 && b < 0 && a<tmpx && b>=tmpy){
								maxp=p;
								cn=2;
							}
					} else if (tmpx <0 && tmpy <0) {
							if (a < 0 && b < 0 && a>=tmpx && b>=tmpy){
								maxp=p;
								cn=3;
							}
					} else {
							if (a > 0 && b > 0  && a<tmpx && b<tmpy){
								maxp=p;
								cn=4;
							}
					}
				}
				}
			}
	cout<<maxp<<" "<<cx<<" "<<minp<<" "<<cn;
	return 0;
}
