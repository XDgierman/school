package project1;
public class Calc{
	private
	int x;
	int y;
	String c;
	public
	float w;
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public Calc() {
	}
	public float Calculate() {
		switch (this.c) {
		case "+":
			w=this.x+this.y;
			break;
			
		case "-":
			w=this.x-this.y;
			break;
			
		case "*":
			w=this.x*this.y;
			break;
			
		case "/":
			try{w=this.x/this.y;}
			catch(Exception t) {
				System.out.println("Nie dziel przez zero.");
				break;
			}
			break;
			
		default:
			System.out.println("Brak dzia³ania.");
			break;
		}
		return w;
	}
}
