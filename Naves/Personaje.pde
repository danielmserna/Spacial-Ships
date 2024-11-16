public class Personaje {
  private float posX, posY;
 private PImage nave;
  public Personaje(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
 nave = loadImage("personaje.png");
  }

  public void pintar() {
   imageMode(CENTER);
   image(nave,posX, posY, 100, 60);
  }

  public void movery(float mY) {
    if (mY>50 && mY<650) {      
      posY = mY;
    }
  }
    public void moverx(float mX) {
    if (mX>50 && mX<950) {      
      posX = mX;
    }
  }
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public void setPosY(float mY){
    posY = mY;
  }
}