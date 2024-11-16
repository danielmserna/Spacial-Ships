Pantalla pantalla;
Personaje personaje;


ArrayList<CDisparo1> disparos;
ArrayList<Enemigo> enemigos;
ArrayList<Ene2> enemigos2;
ArrayList<Vidas> vidas;
ArrayList<aste>aste;
int vida = 3;
int puntaje = 15;

void setup() {
  size(1200, 700);
  pantalla = new Pantalla(0);
  personaje = new Personaje(100, 350);
  disparos = new ArrayList<CDisparo1>();
  enemigos = new ArrayList<Enemigo>();
  enemigos2 =new ArrayList<Ene2>();
  vidas =new ArrayList<Vidas>();

 aste = new ArrayList<aste>();

  for (float a = 0; a<15; a++) {
    
    aste.add(new aste(Math.round(random(-400, 1100)), Math.round(random(-400, 900))));
  }
 for (float v = 0; v<1; v++) {
    vidas.add(new Vidas(Math.round(random(500, 2400)), Math.round(random(0, 700))));
  }
  for (float y = 0; y<10; y++) {
    enemigos2.add(new Ene2(Math.round(random(500, 2400)), Math.round(random(0, 700))));
  }
  for (float h = 0; h<20; h++) {
    enemigos.add(new Enemigo(Math.round(random(500, 2400)), Math.round(random(0, 700))));
  }
}

void draw() {
  
  background(20);
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

// instanciar enemigos
    for (int h = 0; h<enemigos.size(); h++) {
      enemigos.get(h).pintar(); 
      enemigos.get(h).mover();
      

      if (enemigos.get(h).getPosX()<-100) {
        puntaje -= 2;
        enemigos.get(h).setPosX(Math.round(random(1400, 2400)));
        enemigos.get(h).setPosY(Math.round(random(0, 700)));
    
      }


      if (enemigos.get(h).getPosX()<-100) {
        puntaje -= 2;
        enemigos.get(h).setPosX(Math.round(random(1400, 2400)));
        enemigos.get(h).setPosY(Math.round(random(0, 700)));
    
      }
      //instanciar asteroides
  for (int a = 0; a<aste.size(); a++) {
       aste.get(a).pintar(); 
      aste.get(a).moverx();
     aste.get(a).movery();

      if (aste.get(a).getPosX()<-100) {
        puntaje -= 1;
        aste.get(a).setPosX(Math.round(random(1400, 2400)));
        aste.get(a).setPosY(Math.round(random(0, 700)));
      }
      
    }

      //vidas extra
    }

      for (int v= 0; v<vidas.size(); v++) {
     vidas.get(v).pintar();  
      vidas.get(v).mover();
      

      if (vidas.get(v).getPosX()<-100) {
        vidas.get(v).setPosX(Math.round(random(1400, 2400)));
       vidas.get(v).setPosY(Math.round(random(0, 700)));
    
      }
    }
    //enemigos 2

    for (int y = 0; y<enemigos2.size(); y++) {
      enemigos2.get(y).pintar(); 
      enemigos2.get(y).mover();
     

      if (enemigos2.get(y).getPosX()<-100) {
        
         enemigos2.get(y).setPosX(Math.round(random(1400, 2400)));
        enemigos2.get(y).setPosY(Math.round(random(0, 700)));
      }
    }

//disparos1
    for (int i = disparos.size()-1; i>=0; i--) {
      if (disparos.get(i).getPosX()>1220) {
        disparos.remove(i);
      }
    }

    //Evaluar colisiones enemigo-disparo
    for (int i = 0; i<enemigos.size(); i++) {
      for (int j = 0; j<disparos.size(); j++) {
        if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<35) {
          puntaje += 10;
          enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
          enemigos.get(i).setPosY(Math.round(random(0, 700)));
          disparos.remove(j);
        }
      }
    }
        //Evaluar colisiones enemigo-disparo

      for (int i = 0; i<aste.size(); i++) {
      for (int j = 0; j<disparos.size(); j++) {
        if (dist(aste.get(i).getPosX(), aste.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<35) {
          puntaje += 5;
          aste.get(i).setPosX(Math.round(random(1220, 2400)));
          aste.get(i).setPosY(Math.round(random(0, 700)));
          disparos.remove(j);
        }
      }
    }
        //Evaluar colisiones enemigo-disparo

    
      for (int i = 0; i<enemigos2.size(); i++) {
      for (int j = 0; j<disparos.size(); j++) {
        if (dist(enemigos2.get(i).getPosX(), enemigos2.get(i).getPosY(), disparos.get(j).getPosX(), disparos.get(j).getPosY())<35) {
          puntaje += 25;
          enemigos2.get(i).setPosX(Math.round(random(1220, 2400)));
          enemigos2.get(i).setPosY(Math.round(random(0, 700)));
          disparos.remove(j);
        }
      }
    }
    if (puntaje <= 0) {
      pantalla.setPantalla(2);
    }
    //Evaluar colisiones enemigo-personaje
    for (int i = 0; i<enemigos.size(); i++) {
      if (dist(enemigos.get(i).getPosX(), enemigos.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vida--;
        enemigos.get(i).setPosX(Math.round(random(1220, 2400)));
        enemigos.get(i).setPosY(Math.round(random(0, 700)));
      }
      
    }
        //Evaluar colisiones asteroide-personaje

    
    for (int i = 0; i<aste.size(); i++) {
      if (dist(aste.get(i).getPosX(), aste.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vida--;
        aste.get(i).setPosX(Math.round(random(1220, 2400)));
        aste.get(i).setPosY(Math.round(random(0, 700)));
      }
      
    }
    
    
    
        //Evaluar colisiones enemigo-personaje

    
       for (int c = 0; c<enemigos2.size(); c++) {
      if (dist(enemigos2.get(c).getPosX(), enemigos2.get(c).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vida--;
        enemigos2.get(c).setPosX(Math.round(random(1220, 2400)));
        enemigos2.get(c).setPosY(Math.round(random(0, 700)));
      }
      
       
    }
    
    
    
        //Evaluar colisiones vidas-personaje

    for (int i = 0; i<vidas.size(); i++) {
      if (dist(vidas.get(i).getPosX(), vidas.get(i).getPosY(), personaje.getPosX(), personaje.getPosY())<30) {
        vida++;
        vidas.get(i).setPosX(Math.round(random(1220, 2400)));
        vidas.get(i).setPosY(Math.round(random(0, 700)));
      }
      
    }
    
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text(puntaje, 600, 60);

    textAlign(LEFT);
    textSize(24);
    text("Vidas: " + vida, 40, 55);

    if (vida == 0) {
      pantalla.setPantalla(2);
    }

    break;

  case 2:
    textAlign(CENTER);
    textSize(32);
    text("PERDISTE", width/2, height/2);
    textSize(20);
    text("Tu Puntaje es: " + puntaje, width/2, 400);

    break;
  }
}

void keyPressed() {
  switch(pantalla.getPantalla()) {
  case 0:
    if (keyCode == 10) {
      pantalla.setPantalla(1);
    }
    break;
  case 1:
    if (keyCode == 38) {
      personaje.movery(personaje.getPosY()-20);
    }
    if (keyCode == 40) {
      personaje.movery(personaje.getPosY()+20);
    }
    if (keyCode == 37) {
      personaje.moverx(personaje.getPosX()-20);
    }
    if (keyCode == 39) {
      personaje.moverx(personaje.getPosX()+20);
    }
    break;
  }
}

void keyReleased() {
  switch(pantalla.getPantalla()) {
  case 0:
    break;
  case 1:
    if (keyCode == 32) {
      
    if (disparos.size()<7){
          disparos.add(new CDisparo1(personaje.getPosX()+20, personaje.getPosY())); 
    }
    
    
    }
    break;
  }
}