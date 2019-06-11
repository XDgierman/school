package inc;

import java.applet.Applet;
import java.awt.Graphics;


public class Song extends Applet {

	public void paint(Graphics g){
		g.drawString("[Music]", 10, 10);
		try{Thread.sleep(19250);}
		catch(InterruptedException e){}
		g.drawString("If you think we take too much", 10, 30);
		try{Thread.sleep(3000);}
		catch(InterruptedException e){}
		g.drawString("Then you can sacrifice yourelf", 10, 50);
		try{Thread.sleep(2000);}
		catch(InterruptedException e){}
		g.drawString("Dont push your values", 10, 70);
		try{Thread.sleep(1250);}
		catch(InterruptedException e){}
		g.drawString("Push your values", 10, 90);
		try{Thread.sleep(1250);}
		catch(InterruptedException e){}
		g.drawString("Onto the crowd", 10, 110);
	}

}
