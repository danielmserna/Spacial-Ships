package naves;

import processing.core.PApplet;

public class Enemigo {
	private PApplet app;
	private int posX, posY;
	private int c;
	public Enemigo(PApplet app, int posX, int posY) {
		this.app = app;
		this.posX = posX;
		this.posY = posY;
		c = app.color(230,20,0);
	}

	public void pintar() {
		app.fill(c);
		app.triangle(posX-15,posY,posX+15,posY+15,posX+15,posY-15);
	}

	public void mover() {
		posX-=3;
	}

	public int getPosX(){
		return posX;
	}

	public int getPosY(){
		return posY;
	}

	public void setPosX(int mX){
		posX = mX;
	}

	public void setPosY(int mY){
		posY = mY;
	}
}
