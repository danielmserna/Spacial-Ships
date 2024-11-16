public class Enemigo {
  private int posX, posY;
  private color c;
  private int velocidad;
  public Enemigo(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    this.velocidad=3;
    c = color(#27A8D5);
  }

  public void pintar() {
    fill(c);
    triangle(posX-5 ,posY,posX+15,posY+15,posX+15,posY-15);
  }

  public void mover() {//VELOCIDAD DEL ENEMGIO
    posX-=velocidad;
  }
  
  public int getPosX(){
    return posX;
  }
  
  public int getPosY(){
    return posY;
  }
  
  public void setPosX(int mX){
    posX = mX;
  }
  
  public void setVelocidad(int vel){
    velocidad = vel;
  }
  
  public void setPosY(int mY){
    posY = mY;
  }
}