public class Ene2 extends Ene{
private PImage ene;
public Ene2(float posX, float posY) {
  super(posX, posY);
   ene = loadImage("enemigo 3.png");
  }
 public void mover() {
              super.posX-=4;}
  public void pintar() {
       imageMode(CENTER);
       image(ene,super.posX, super.posY, 50, 50);
       }

 
  }