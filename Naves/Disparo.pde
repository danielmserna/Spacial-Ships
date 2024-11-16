public class Disparo {
  private float posX, posY;
 //PImage disparo;
  public Disparo(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    //disparo = loadImage("balas.png");
    
  }
    public void pintar() {    
    ellipse(posX, posY, 8, 8);
  }

  public void mover() {
    posX += 8;
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
  public void setPosX(float mX){
    posX = mX;
  }
}