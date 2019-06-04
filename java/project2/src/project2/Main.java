package project2;
import java.applet.*;
import java.awt.*;
import java.util.Random;

public class Main extends Applet {
	public
	Random r=new Random();
	public void paint (Graphics gDC) {
		for (int i=1; i<8; i = i+1) {
			for (int j=1; j<6; j = j+1) {
				try{Thread.sleep(250);}
			    catch(InterruptedException e){}
				Color k = new Color(r.nextInt(8388607));
				gDC.setColor(k);
				gDC.fillOval(i*100,j*100,100,100);
				System.out.println(i+" "+j);
			}
		}
	}
}
