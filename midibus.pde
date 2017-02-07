void iniciarMidibus(){
    // List all our MIDI devices
    // MidiBus.list();
    // Connect to one of the devices
    myBus = new MidiBus(this, "nanoKONTROL2 1 SLIDER/KNOB","nanoKONTROL2 1 CTRL");
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  
  //TAMAÑO
  
  if (number == 38){
    xcant++;
    println("xcant",xcant);
  }
  if (number == 54 && xcant>2){
    xcant--;
    println("xcant",xcant);
  }
  
  if (number == 39){
    ycant++;
    println("cant",ycant);
  }
  if (number == 55 && ycant>2){
    ycant--;
    println("ycant",ycant);
  }
  
  
  
  if (number ==  16) {
   size = map(value,0,127,0,width); 
  }
  
  //TAMAÑO DE LA CIRCUNFERENCIA
  if (number == 17) {
     modulo = map(value,0,127,0,400); 
  }
  
  //EFECTO ESPIROGRAFICO
  if (number == 18) {
   inc = map(value,0,127,0,width /5) * 0.1; 
  }
  
  if (number == 19) {
    soundsensibility = map(value,0,127,0,1024); 
  }
  //HUE
  if (number == 20) {
     hue = map(value,0,127,0,255); 
  }
  if (number == 21) {
   sat = map(value,0,127,0,255); 
  }
  if (number == 22) {
     bri = map(value,0,127,0,255); 
  }
  if (number == 23) {
   trans = map(value,0,127,0,255); 
  }
  
  //Poligono 
  
  if (number == 59 ){
    
    npoints++;
    println("Npoints",npoints);
  }
  if (number == 58 && npoints > 1){
   npoints--;
   println("Npoints",npoints);
  }
  
  //stop
  if (number == 42){
   cont = 0;
   Ccont = 0;
   flagCcont = 0;
  }
  
  if (number == 61 && cont > 0) {
   cont--; 
  }
  
  if (number == 62){
   cont++; 
  }
   
  //COLOR
  if (number == 32){
    colormanual = !colormanual;
  
  }
  
  //Random
  if (number == 48){
   
    israndom = !israndom;
  }

  
  //modo limpia siempre 
  if (number == 65){
     displaymode++;
     if (displaymode == 4){
     displaymode = 1;
     }
    println("Displaymode = ",displaymode);
  }
  
  if (number == 33){
   background(255); 
  }
  
  if (number == 49){
    isbackground = !isbackground;
  }
  
  if (number == 0 ){
    Bsize = map(value,0,127,0,150); 
    
    print("Bsize");
    println(Bsize);
  }
  
  if (number == 1){
    Bhue = map(value,0,127,0,255); 
    
    print("Bhue");
    println(Bhue);
    
  }
  
  if (number == 2){
    Bsat = map(value,0,127,0,255); 
    print("Bsat");
    println(Bsat);
  }
  
  if (number == 3){
    Bbri = map(value,0,127,0,255); 
    print("Bbri");
    println(Bbri);
  }
  
  if (number == 4){
    Btrans = map(value,0,127,0,255); 
    print("Btrans");
    println(Btrans);
  }
  
  if (number == 70){
        switch (incdefaults){
          case 0 : 
            incdefaults++;
            inc = 8;
            break;        
          case 1 : 
            incdefaults++;
            inc = 15;
            break;
          case 2 : 
            incdefaults = 0;
            inc = 20;
            break;  
        }
  }
  
  if (number == 50 && Ccont > 0){
     if (Ccont == 0){
       
     }
     Ccont--; 
  }
  if (number == 41 && Ccont <= cont && displaymode == 3) {
     
     println("Ccont ",Ccont);
     
     if (Ccont >= cont){
      Ccont = 0; 
     }     
     Ccont++;
    
     if (flagCcont == 0){
       
       flagCcont = 1;
     }
     println("Ccont ",Ccont);
    // println(con
  }
  
  if (number == 6) {
   speedX = map(value,0,127,0,10); 
   println("SpeedX",speedX);
  }
  if (number == 7) {
   speedY = map(value,0,127,0,10); 
   println("SpeedX",speedY);
  }
  
}