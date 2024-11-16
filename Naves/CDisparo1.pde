public class CDisparo1 extends Disparo{
private PImage cdisparo1;
public CDisparo1(float posX, float posY) {
  super(posX, posY);
   cdisparo1 = loadImage("balas.png");
  }

  public void pintar() {
       imageMode(CENTER);
       image(cdisparo1,super.posX, super.posY, 30, 30);
       }

 
  }