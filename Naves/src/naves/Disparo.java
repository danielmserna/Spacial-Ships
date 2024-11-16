package naves;

import processing.core.PApplet;

public class Disparo {
	private PApplet app;
	private int posX, posY;
	public Disparo(PApplet app, int posX, int posY) {
		this.app = app;
		this.posX = posX;
		this.posY = posY;
	}

	public void pintar() {    
		app.ellipse(posX, posY, 8, 8);
	}

	public void mover() {
		posX+=3;
	}

	public int getPosX(){
		return posX;
	}

	public int getPosY(){
		return posY;
	}

	public void setPosY(int mY){
		posY = mY;
	}
}

