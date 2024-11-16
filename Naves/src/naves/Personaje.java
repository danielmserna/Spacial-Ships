package naves;

import processing.core.PApplet;
import processing.core.PConstants;

public class Personaje {
	private PApplet app;
	private int posX, posY;
	//private PImage nave;
	public Personaje(PApplet app, int posX, int posY) {
		this.app = app;
		this.posX = posX;
		this.posY = posY;
		//nave = loadImage("nave.png");
	}

	public void pintar() {
		app.rectMode(PConstants.CENTER);
		app.rect(posX, posY, 15, 50);
	}

	public void mover(int mY) {
		if (mY>50 && mY<650) {      
			posY = mY;
		}
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

