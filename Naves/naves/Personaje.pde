public class Personaje {
  private int posX, posY;
 // private PImage nave;
  public Personaje(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
   // nave = loadImage("nave.png");
  }

  public void pintar() {
    rectMode(CENTER);
    rect(posX, posY, 15, 50);
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