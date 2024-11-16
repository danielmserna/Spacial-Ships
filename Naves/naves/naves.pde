Pantalla pantalla;
Personaje personaje;

ArrayList<Disparo> disparos;
ArrayList<Enemigo> enemigos;
ArrayList<Enemigo2> enemigos2;

int vidas = 5;
int puntaje = 0;
int nivel=1;

void setup() {
  size(1200, 700);
  pantalla = new Pantalla(0);
  personaje = new Personaje(50, 350);//COORDENADAS DEL PERSONAJE
  
  disparos = new ArrayList<Disparo>();
  enemigos = new ArrayList<Enemigo>();
  enemigos2 = new ArrayList<Enemigo2>();

  for (int i = 0; i<36; i++) {
    enemigos.add(new Enemigo(Math.round(random(500, 2400)), Math.round(random(0, 700))));
    enemigos2.add(new Enemigo2(Math.round(random(500, 1000)), Math.round(random(600, 700))));
  }
}

void draw() {
  background(60);
  switch(pantalla.getPantalla()) {
  case 0:
    textAlign(CENTER);
    text("Pulsa ENTER para empezar", width/2, height/2);
    break;
  case 1:
    personaje.pintar();
    for (int i = 0; i<disparos.size(); i++) {
      disparos.get(i).pintar(); 
      disparos.get(i).mover();
    }
    
    for (int i = 0; i<disparos.size(); i++) {
      disparos.get(i).pintar(); 
      disparos.get(i).mover();
    }
     
    

    for (int i = 0; i<enemigos.size(); i++) { //Recorrido de arreglo de enemigos
      enemigos.get(i).pintar();  //pinta los enemigos
      enemigos.get(i).mover();   //Mueve los enemigos

      if (enemigos.get(i).getPosX()<-10) {  //Cuando los enemigos tengan un valor de -20 en el eje x reasignarles coordenadas las siguientes coordenadas
        enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
        enemigos.get(i).setPosY(Math.round(random(0, 700)));
      }
    }
    
    for (int i = 0; i<enemigos2.size(); i++) { //Recorrido de arreglo de enemigos
      enemigos2.get(i).pintar();  //pinta los enemigos
      enemigos2.get(i).moverx();   //Mueve los enemigos
      enemigos2.get(i).movery();   //Mueve los enemigos

      if (enemigos2.get(i).getPosX()<-10) {  //Cuando los enemigos tengan un valor de -20 en el eje x reasignarles coordenadas las siguientes coordenadas
        enemigos2.get(i).setPosX(Math.round(random(500, 1000)));
        enemigos2.get(i).setPosY(Math.round(random(600, 700)));
      }
    }

    for (int i = disparos.size()-1; i>=0; i--) {
      if (disparos.get(i).getPosX()>1220) {  //Cuando los disparos alcanzan el valor en 1220, los disparos se pierden
        disparos.remove(i);
      }
    }

    //Evaluar colisiones enemigo-disparo
    for (int i = 0; i<enemigos.size(); i++) {
      for (int j = 0; j<disparos.size(); j++) {
        if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<20) {//COLISION
          puntaje += 10;
          enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
          enemigos.get(i).setPosY(Math.round(random(0, 700)));
          disparos.remove(j);
        }
      }
    }
    
    for (int i = 0; i<enemigos2.size(); i++) {
      for (int j = 0; j<disparos.size(); j++) {
        if (dist(enemigos2.get(i).getPosX(), enemigos2.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<20) {//COLISION
          puntaje += 10;
          enemigos2.get(i).setPosX(Math.round(random(1220, 2400)));
          enemigos2.get(i).setPosY(Math.round(random(0, 700)));
          disparos.remove(j);
        }
      }
    }

    //Evaluar colisiones enemigo-personaje
    for (int i = 0; i<enemigos.size(); i++) {
      if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vidas--;
        enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
        enemigos.get(i).setPosY(Math.round(random(0, 700)));
      }
    }
    
    for (int i = 0; i<enemigos2.size(); i++) {
      if (dist(enemigos2.get(i).getPosX(), enemigos2.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vidas--;
        enemigos2.get(i).setPosX(Math.round(random(1220, 2400)));
        enemigos2.get(i).setPosY(Math.round(random(0, 700)));
      }
    }
    
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("PUNTAJE: " + puntaje, 600, 60);
    
    textAlign(CENTER);
    textSize(32);
    text("Nivel: " + nivel, 1100, 60);
    
    if(puntaje >200){//Nivel 2
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(5);
      }
      nivel=2;
    }
    
    if(puntaje > 400){//Nivel 3
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(10);
      }
      nivel=3;
    }
    
     if(puntaje > 750){//Nivel 4
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(13);
      }
      nivel=4;
    }
     if(puntaje > 1000){//Nivel 5
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(17);
      }
      nivel=5;
      
    }
      if(puntaje >1800){//Nivel 6
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(21);
      }
      nivel=6;
    }
    
    if(puntaje >2500){//Nivel 7
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(25);
      }
      nivel=7;
    }
    
     if(puntaje >3400){//Nivel 8
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(29);
      }
      nivel=8;
    }
     if(puntaje >4100){//Nivel 8
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(35);
      }
      nivel=9;
    }
    
    if(puntaje >5000){//Nivel 10
      for (int i = 0; i<enemigos.size(); i++) {
            enemigos.get(i).setVelocidad(40);
      }
      nivel=10;
    }
    
  
    
    
    if (puntaje>4500)
    {
    textAlign(LEFT);
    textSize(28);
    text("SOS GRANDE!!", 60, 125);
    }

    textAlign(LEFT);
    textSize(24);
    text("Vidas: "+vidas, 40, 55);

    if (vidas == 0) {
      pantalla.setPantalla(2);
    }

    break;

  case 2:
    textAlign(CENTER);
    textSize(32);
    text("PERDISTE", width/2, height/2);

    break;
  }
}

void keyPressed() {
  switch(pantalla.getPantalla()) {
  case 0:
  
    if (keyCode == 10) {//ENTER
      pantalla.setPantalla(1);
    }
    break;
  case 1:
    if (keyCode == 38) {//ARRIBA
      personaje.mover(personaje.getPosY()-20);
    }
    if (keyCode == 40) {//ABAJO
      personaje.mover(personaje.getPosY()+20);
    }
    if(puntaje>200){
    
    }
    break;
  }
}

void keyReleased() {
  switch(pantalla.getPantalla()) {
  case 0:
    break;
  case 1:
    if (keyCode == 32) {//ESPACIO
      disparos.add(new Disparo(personaje.getPosX()+10, personaje.getPosY()));
    }
    break;
  }
}