public class Enemigo2 {
  private int posX, posY, velocidad;
 // private PImage nave;
  public Enemigo2(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    this.velocidad = 2;
   // nave = loadImage("nave.png");
  }

   public void pintar() {    
    ellipse(posX, posY, 39, 39);
  }
  
 public void moverx() {//VELOCIDAD DEL ENEMGIO
    posX-=velocidad*2;
  }
   public void movery() {//VELOCIDAD DEL ENEmigo...............
    posY -= velocidad;
  }
  //public void mover(int mY) {
  //  if (mY>50 && mY<650) {      
  //    posY = mY;
  //  }
  //}
  
  public int getPosX(){
    return posX;
  }
  
  public int getPosY(){
    return posY;
  }
  
  public void setPosY(int mY){
    posY = mY;
  }
  
  public void setPosX(int mX){
    posX=mX;
  }
}