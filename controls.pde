/*
CONTROLES 
 
 t,g : Para aumentar y disminuir el tamaño del dibujo
 y,h : Para aumentar y disminuir la circunferencia de giro
 u,j : Para aumentar el efecto espirografico.
 A  : Para limpiar la pantalla
 D  : Para activar el modo que se limpia la pantalla constantemente
 Q  : Para randomizar de 0 el tamaño al ultimo tamaño asignado.
 E  : Para activar el color manual de colores 
 modo HSB
 I,K Para aumentar y disminuir el HUE
 O,L Para aumentar y disminuir la saturacion
 P,Ñ Para aumentar y disminuir el brillo.
 B,N : transparencia. 
 
 R : Para resetear los valores del dibujo al minimo
 
 1: Colores del borde
 2,3: Tamaño del borde
 4,5: Saturación del borde
 6,7: brillo del borde
 8,9: transparencia del borde
 
 V : MODO DISPLAY 
 1) DIBUJO SOLO. En este modo es solo un patron de dibujos. sin que se mueva.
 
 M: Modo mouse o no mouse. Dibuja solo cuando apretas el mouse o dibuja siempre.
 
 
 2) MODO OBJETOS . Con cada click genera un objeto que se va moviendo. 
 
 C: Te desactiva el ultimo objeto que apretaste. Lo inhabilita(el dibujo queda hecho);
 3) MODO OBJETOS SETIABLES. 
 Se pueden crear grupos de objetos seteados con variables para luego poder crear otros y tener distintos grupos.
 para hacer varias figuras moviendose. 
 
 BARRA ESPACIADORA : Setea un grupo de objetos para que no cambien las variables
 (Todos los que se crearon desde que se apreto el mouse hasta que se apreto la barra espaciadora).
 
 
 B : PRINT SCREEN
 */


void mousePressed() {

  if (displaymode==3) {
    display3[cont].setPos(mouseX, mouseY);
  
  Ccontgroup[Ccont+1] = cont;

  for (int i=0; i<=Ccont; i++) {
    println("CCcont", i);
    println("Ccontgroup[Ccont] = ", Ccontgroup[i]);
  }

  cont++;

  if (cont == display3.length) {
    cont = 0;
  }
  }
}


void keyPressed() {


  if (key == CODED) {
    if (keyCode == LEFT) {
      
     
      if (displaymode == 2) {
      xcant++;
      }
      speedX++; 
      
    }
    if (keyCode == RIGHT) {
     
      if (displaymode == 2 && xcant > 0 ) {
      xcant--;
      }
      
      if (speedX > 0){
         speedX--; 
      }
      
    }
    if (keyCode == UP) {
      speedY++; 
      
      if (displaymode == 2) {
        ycant++;
      }
      
      Cantobj++; 
      println("Cantobj", Cantobj);
    }
    
    if (keyCode == DOWN){
      Cantobj--;
    }
    
    if (keyCode == DOWN ) {
      if (speedY > 0){
      speedY--; 
      }
      
      if (displaymode == 2 && ycant > 0) {
        ycant--;
      }
      if(Cantobj > 1){
        Cantobj--; 
        println("Cantobj", Cantobj);
      }
    }
    
     
  }

  if (key == '+') {
    soundsensibility+=sumator;
    println("soundsensibility ", soundsensibility);
  }

  if (key == '}' && soundsensibility > 0) {
    soundsensibility-=sumator; 
    println("soundsensibility ", soundsensibility);
  }

  if (key == 't') {
    size+=sumator;
    println("Size :", size);
  }
  if (key == 'g' && size > sumator) {
    size-=sumator;
    println("Size :", size);
  }
  if (key == 'y') {
    modulo+=sumator;
    println("Modulo :", modulo);
  }
  if (key == 'h' && modulo > sumator) {
    modulo-=sumator;  
    println("Modulo :", modulo);
  }

  if (key == 'u' ) {
    inc+=sumator * 0.1;
    println("inc :", inc);
  }
  if (key == 'j' ) {
    inc-=sumator * 0.1;
    println("inc :", inc);
  }

  if (key == 'a') {
    fill(0);
    rectMode(CORNER);
    rect(0,0,width,height);
    println("Reset background ");
    rectMode(CENTER);
  }
  if (key == 'd') {  
    isbackground = !isbackground;
    println(isbackground, "isbackground : ");
  }
  
  //RESET
  if (key == 'r') {
    modulo = 0;
    size = 30;
    inc = 0;
    cont = 0;
    hue = 100;
    sat = 150;
    bri = 255; 
    
    Bhue = 80;
    Bsat = 150;
    Bbri = 0;
    Cantobj = 0;
    colormanual = true;
    israndom = false;
    println("Reset all");
    Ccont = 0 ;
    flagCcont=0;
  }

  if (key == 'q') {

    israndom = !israndom; 
    println("Is random : ",israndom);
  }
  if (key == 'e') {
    colormanual = !colormanual; 
    println("colormanual :",colormanual);
  }  
  if (key == 'i' && colormanual) {
    hue+=sumator;
    println("hue", hue);
    if (hue >= 255) {
      hue = 0;
    }
  }
  /*if (key == 'k' && colormanual && hue > 0) {
   hue-=sumator;
   print("Hue");
   println(hue);
   }*/
   
  if (key == 'o' && colormanual && sat+sumator  < 255) {
    sat+=sumator;
    println("Saturacion ", sat);
  }
  if (key == 'l' && colormanual && sat > sumator) {
    sat-=sumator;
    println("Saturacion ", sat);
  }
  if (key == 'p' && colormanual && bri+sumator  < 255) {
    bri+=sumator;
    println("Brillo ", bri);
  }
  if (key == 'ñ' && colormanual  && bri  > sumator) {
    bri-=sumator;
    println("Brillo ", bri);
  }
  if (key == 'n' && trans+sumator  <= 255) {
    trans+=sumator; 
    println("Transparencia ", trans);
  }
  if (key == 'b'  && trans > sumator) {
    trans-=sumator; 
    println("Transparencia ", trans);
  }

  if (key == 'm') {
    ismousemode = !ismousemode;
  }
  if (key == 'v') {
    displaymode++;
    if (displaymode == 6) {
      displaymode = 1;
    }
    println("Display Mode :  ", displaymode);
  }
  if (key == 'c' && cont > 0 ) {
    cont--;
  }
  if (key == 'f' && Ccont > 0 && cont > 1) {
    Ccont--;
  }

  if (key == 'z') {

    npoints++; 
    print("npoints");
    println(npoints);
  }

  if (key == 'x' && npoints > 1) {
    npoints--;
    print("npoints");
    println(npoints);
  }

  if (key == '1' && Bsize > 0) {
    Bsize-= sumator;  
    println("Bsize", Bsize);
  }

  if (key == '2' && Bsize+sumator <= 255 ) {
    Bsize+= sumator;
    println("Bsize", Bsize);
  }
  if (key == '3') {
    Bhue+= sumator;

    if (Bhue >= 255) {
      Bhue = 0;
    }
    println("Bhue", Bhue);
  }
  if (key == '4' && Bsat >= sumator) {
    Bsat-=sumator;
    println("Bsat", Bsat);
  }
  if (key == '5' && Bsat+sumator  <= 255) {
    Bsat+=sumator;
    println("Bsat", Bsat);
  }
  if (key == '6' && Bbri >=sumator ) {
    Bbri-=sumator;
    println("Bbri", Bbri);
  }
  if (key == '7' && Bbri+sumator  <=255) {
    Bbri+=sumator;
    println("Bbri", Bbri);
  }
  if (key == '8' && Btrans+sumator  <= 255) {
    Btrans+=sumator;
    println("Btrans", Btrans);
  }
  if (key == '9' && Btrans >= sumator) {
    Btrans-=sumator;
    println("Btrans", Btrans);
  }
  if (key == '+') {
    sumator++;
    println("Sumator",sumator);
  }

  if (key == '-' && sumator > 0) {
    sumator--;
    println("Sumator",sumator);
  }
  if (key == 'b'){
    
   starorpoly = !starorpoly; 
   
  }
  if (key == ' ' && Ccont <= cont && displaymode == 3) {
    Ccont++;
    pushMatrix();
    
    translate(0,0,+20);
    popMatrix();
    if (Ccont == cont) {
      Ccont = 0; 
      flagCcont = 1;
    }

    if (flagCcont == 0) {
      flagCcont = 1;
    }
  }
  
  if(key == 'B'){
    saveFrame("img/####-spiro.jpg");
  }
}

void mouseWheel(MouseEvent event) {

  //float e = event.getCount();
  // println(e);
  if (event.getCount() == 1 || ( (event.getCount() == -1) && sumator > 1) ) {
    sumator+= event.getCount();
  }
  println("Sumator : ", sumator);
}