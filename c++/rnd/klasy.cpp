#include <iostream>
using namespace std;

class punkt{
	private:
		int x1;
		int x2;
		int y1;
		int y2;
	public:
		punkt(){
		}
		punkt(int x, int y, int a, int b){
		this->x1=x;
		this->x2=y;
		this->y1=a;
		this->y2=b;	
		}
		void set_x1(int x){
			this->x1=x;
		}
		void set_x2(int x){
			this->x2=x;
		}
		void set_y1(int x){
			this->y1=x;
		}
		void set_y2(int x){
			this->y2=x;
		}
		int get_x1(){
			return x1;
		}
		int get_x2(){
			return x2;
		}
		int get_y1(){
			return y1;
		}
		int get_y2(){
			return y2;
		}
		void  wyswietl(){
			cout<<"x1="<<get_x1()<<", x2="<<get_x2()<<", y1="<<get_y1()<<", y2="<<get_y2()<<endl;
		}
};



int main(){
punkt punkt1;
punkt1.set_x1(5);
punkt1.set_x2(6);
punkt1.set_y1(2);
punkt1.set_y2(8);
punkt1.wyswietl();
punkt *punkt2=new punkt(5,8,5,1);
punkt2->wyswietl();
}
