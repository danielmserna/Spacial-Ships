public class aste extends Ene{
  private PImage nave;
  private float menos = 0.2;
  public aste(float posX, float posY) {
    super(posX, posY);
    nave = loadImage("asteroide.png");
  }
public void moverx(){
  super.posX-= menos ;
}
   public void movery() {//VELOCIDAD DEL ENEmigo...............
    super.posY += (Math.round(random(-3, 3)));
  }
  //public void mover(float mY) {
  //  if (mY>50 && mY<650) {      
  //    posY = mY;
  //  }
  //}
public void pintar() {
    imageMode(CENTER);
       image(nave,super.posX, super.posY, 50, 50);
       }
}