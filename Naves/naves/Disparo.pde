public class Disparo {
  private int posX, posY;
  public Disparo(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
  }

  public void pintar() {    
    ellipse(posX, posY, 11, 11);
  }

  public void mover() {//VELOCIDAD DEL DISPARO
    posX+=3;
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