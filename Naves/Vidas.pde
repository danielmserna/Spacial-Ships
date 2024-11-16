public class Vidas{
  private float posX, posY;
  PImage vida;
public Vidas(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    vida = loadImage("vida.png");
      }
      
  public void pintar() {
       imageMode(CENTER);
       image(vida,posX, posY, 30, 30);
       }
  public void mover() {
    posX-=17;
  }
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public void setPosX(float mX){
    posX = mX;
  }
  
  public void setPosY(float mY){
    posY = mY;
  }
}