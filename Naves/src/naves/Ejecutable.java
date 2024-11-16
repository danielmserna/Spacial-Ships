package naves;

import java.util.ArrayList;

import processing.core.PApplet;

public class Ejecutable extends PApplet{
	Pantalla pantalla;
	Personaje personaje;

	ArrayList<Disparo> disparos;
	ArrayList<Enemigo> enemigos;

	int vidas = 3;
	int puntaje = 0;

	public void settings() {
		size(1200, 700);
		pantalla = new Pantalla(0);
		personaje = new Personaje(this, 100, 350);
		disparos = new ArrayList<Disparo>();
		enemigos = new ArrayList<Enemigo>();

		for (int i = 0; i<20; i++) {
			enemigos.add(new Enemigo(this,Math.round(random(500, 2400)), Math.round(random(0, 700))));
		}
	}

	public void draw() {
		background(20);
		switch(pantalla.getPantalla()) {
		case 0:
			textSize(24);
			textAlign(CENTER);
			text("Pulsa ENTER para empezar", width/2, height/2);

			break;
		case 1:
			personaje.pintar();
			for (int i = 0; i<disparos.size(); i++) {
				disparos.get(i).pintar(); 
				disparos.get(i).mover();
			}

			for (int i = 0; i<enemigos.size(); i++) {
				enemigos.get(i).pintar(); 
				enemigos.get(i).mover();

				if (enemigos.get(i).getPosX()<-20) {
					enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
					enemigos.get(i).setPosY(Math.round(random(0, 700)));
				}
			}

			for (int i = disparos.size()-1; i>=0; i--) {
				if (disparos.get(i).getPosX()>1220) {
					disparos.remove(i);
				}
			}

			//Evaluar colisiones enemigo-disparo
			for (int i = 0; i<enemigos.size(); i++) {
				for (int j = 0; j<disparos.size(); j++) {
					if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<20) {
						puntaje += 10;
						enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
						enemigos.get(i).setPosY(Math.round(random(0, 700)));
						disparos.remove(j);
					}
				}
			}

			//Evaluar colisiones enemigo-personaje
			for (int i = 0; i<enemigos.size(); i++) {
				if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
					vidas--;
					enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
					enemigos.get(i).setPosY(Math.round(random(0, 700)));
				}
			}
			fill(255);
			textAlign(CENTER);
			textSize(32);
			text(puntaje, 600, 60);

			textAlign(LEFT);
			textSize(24);
			text("Vidas: "+vidas, 40, 55);

			if (vidas == 0) {
				pantalla.setPantalla(2);
			}

			break;

		case 2:
			textAlign(CENTER);
			textSize(32);
			text("PERDISTE", width/2, height/2);
			textSize(24);
			text("Puntaje: " + puntaje, width/2, (height/2)+40);

			break;
		}
	}

	public void keyPressed() {
		switch(pantalla.getPantalla()) {
		case 0:
			if (keyCode == 10) {
				pantalla.setPantalla(1);
			}
			break;
		case 1:
			if (keyCode == 38) {
				personaje.mover(personaje.getPosY()-20);
			}
			if (keyCode == 40) {
				personaje.mover(personaje.getPosY()+20);
			}
			break;
		}
	}

	public void keyReleased() {
		switch(pantalla.getPantalla()) {
		case 0:
			break;
		case 1:
			if (keyCode == 32) {
				disparos.add(new Disparo(this,personaje.getPosX()+20, personaje.getPosY()));
			}
			break;
		}
	}


	static public void main(String args[]) {
		PApplet.main(new String[] { "naves.Ejecutable" });
	}


}
