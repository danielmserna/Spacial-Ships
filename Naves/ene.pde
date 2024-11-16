public class Ene{
  private float posY;
  private float posX;
  
public Ene(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
 
  }
  public void mover() {
    posX-=0;
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