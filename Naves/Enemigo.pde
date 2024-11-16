public class Enemigo extends Ene{
  
private PImage ene;
public Enemigo(float posX, float posY) {
  super(posX, posY);
      ene = loadImage("enemigo 1.png");
  }
    public void mover() {
              super.posX-=3;}
  public void pintar() {
       imageMode(CENTER);
       image(ene,super.posX, super.posY, 50, 50);
       }


}