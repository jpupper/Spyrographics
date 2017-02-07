import spout.*;
import themidibus.*; //Librería del controlador midi.
import ddf.minim.*; //Librería de sonido.
import controlP5.*;
import oscP5.*;
import netP5.*;


/* Spirographics. 
 Software de dibujo y visuales que permite definir objetos que se mueven como un espirografo.
 Todo lo demas fue creado por Julián Puppo. 2016 */

/*Cambios a realizar :
 Terminar de corregir como funciona el cambio del seteo
 
 */
OscP5 oscP5;
NetAddress myRemoteLocation;

//SPOUT
Spout spout;
String sendername;
String[] controlName;
int[] controlType;
float[] controlValue;
String[] controlText;
String UserText = "";

//SONIDO
Minim minim;
AudioInput in;
float freq;
float soundsensibility = 500;
MidiBus myBus;

//Variables que manejan el dibujo
float size = 150;
float size2 = 50;
float modulo=0;
float inc= 0 ;

//Colores 
float hue = 100, sat = 150, bri = 255, trans = 255;

int col=0;
//Sumator
int sumator = 1;

//BORDE

float Bsize = 4, Bhue = 60, Bsat= 255, Bbri = 50, Btrans =255;

boolean isbackground = false;
boolean israndom = false;
boolean colormanual = true;
boolean isobject = false;
boolean  bool_modulo=false, bool_inc=false,
         bool_size= true, bool_hue=false,bool_sat=false,bool_bri=false,bool_trans=false,
         bool_Bsize=false,bool_Bhue=false,bool_Bsat=false,bool_Bbri=false,bool_Btrans=false ;
boolean starorpoly = true;

boolean ismousemode = true;

int displaymode=3;
/* Va a tener 3 modos. 

 Modo 1) 1 : Dibujo constante, modo standart. siempre está haciendo un dibujo. 
 Modo 2) 2 : Se modifican los valores de todos los dibujos cada vez que cambias una variable.
 Modo 3) 3 : Se modifica el objeto especifico que haya sido seleccionado
 Modo 4) 4 : Array tipo matriz para utilizar con la aplicación ControlOSC-MultiBotton Demo 
 Modo 5) 5 : Modo para mover cada objeto por separado utilizando ControlOSC-MultiTouchXY */
float speedX =0;
float speedY =0;

// Variables para el flujo del programa                    
int cont = 0 ; //Contador que recorre la matris de objetos.
int npoints = 5; //Cantidad de puntas que tiene el poligono. 
/* Si tiene 1, se dibujara un circulo
 si tiene 2 , una linea,
 si tiene 3 , triangulo and so on and so on */

int Ccont = 0 ; //Variable que almacena que numero de dibujo se va a modificar;
int [] Ccontgroup = new int[50]   ;

int incdefaults; //Una variable para poner el modulo en valores puros.

boolean flag = false; // Para que no empiece dibujando el primero.
int flagCcont = 0; // para que el modo 3 funcione bien.

//Cantidad de objetos en modo array bidimensional 
int xcant = 2;
int ycant = 2;

Spirograph display1 = new Spirograph(width/2, height/2, 50, 70, 0, false, 200, 255, 255, 255, 1, 200, 200, 255, 255, false, 1);

int cols = 1000; 
int rows = 1000;

Spirograph [][] display2 = new Spirograph[rows][cols];
Spirograph [] display3 = new Spirograph[1280+768];

Spirograph [][] display4 = new Spirograph[8][8];
boolean showdisplay4[][] = new boolean[8][8];

Spirograph [] display5 = new Spirograph[60];
int Cantobj=10;

ControlFrame cf;

void settings(){
 // fullScreen(P3D);
  size(1200,600,P2D);
}
void setup() {
  hint(DISABLE_DEPTH_TEST);
  //cf = new ControlFrame(this,200,600,"box");
  iniciarspout();
  oscP5 = new OscP5(this,8080);
  myRemoteLocation = new NetAddress("192.168.43.75",8080);

  textureMode(NORMAL);
  background(0);

  colorMode(HSB);
  rectMode(CENTER);
  //inicializar array de objetos

  for (int i=0; i<cols; i++) {
    for (int k=0; k<rows; k++) {
      display2[k][i] = new Spirograph(-60, -60, 50, 70, 0, false, 200, 255, 255, 255, 1, 200, 200, 255, 255, false, 1);
    }
  }

  for (int i=0; i<display3.length; i++) {
    display3[i] = new Spirograph(-60, -60, 50, 70, 0, false, 200, 255, 255, 255, 1, 200, 200, 255, 255, false, 1);
  }
  
  for (int i=0; i<=7; i++){
    for (int k=0; k<=7; k++){
       display4[k][i] = new Spirograph(90, 90, 50, 70, 0, false, 200, 255, 255, 255, 1, 200, 200, 255, 255, false, 1);
       showdisplay4[k][i] = true;
    }
  }
  
  for (int k=0; k<60; k++){ 
       display5[k]= new Spirograph(90, 90, 50, 70, 0, false, 200, 255, 255, 255, 1, 200, 200, 255, 255, false, 1);
  }
  println(width);
  print(height);
  
  //inicializar array contador de grupos
  /*for (int i=0; i<=200; i++){
   Ccontgroup[i] = 0; 
   }*/
   
  Ccontgroup[cont] = 0;
  
  iniciarMinim();
  //iniciarMidibus();
  displaymode=3;
}

void draw() {

  hint(DISABLE_DEPTH_TEST);
  ControlesSpout();
  
  
  freq = abs( in.left.get(250)*1024 ) ;
  freq = map(freq, 0, 1024, 0, soundsensibility);

  if (isbackground) {
    fill(0);
    rect(0,0,width*4,height*4);
     hint(DISABLE_DEPTH_TEST);
  }  
   hint(DISABLE_DEPTH_TEST);
  if (displaymode == 1) {
   
    if (ismousemode == false) {
      display1.display();
    } else if (mousePressed && ismousemode) {

       display1.display();
    }
    display1.setPos(mouseX, mouseY);
    display1.setSettings(size,size2, modulo, inc, colormanual, hue, sat, bri, trans, Bsize, Bhue, Bsat, Bbri, Btrans, israndom, npoints,starorpoly,speedX,speedY);
  }

  //MODO DISPLAY 2 
  else if (displaymode == 2 ) {

    for (int y=1; y< ycant; y++) {
      for (int k=1; k< xcant; k++) { 
        hint(DISABLE_DEPTH_TEST);
        display2[k][y].setPos(width * k/xcant, height * y/ycant);
        display2[k][y].setSettings(size+map(freq, 0, 1024, 0, 255),size2, modulo, inc, colormanual, hue, sat, bri, trans, Bsize, Bhue, Bsat, Bbri, Btrans, israndom, npoints,starorpoly,speedX,speedY);
      /*  if (y == 1 || k == 1 || k == xcant -1 || y == ycant -1 ){
        display2[k][y].setSettings(size+freq-200, modulo, inc, colormanual, hue, sat, bri, trans, Bsize+3, Bhue+freq, Bsat, Bbri, Btrans, israndom, npoints+1);  
        }*/
        
        display2[k][y].move();
        display2[k][y].display();
      }
    }
  } else if (displaymode == 3) {  
    for (int l=Ccontgroup[Ccont]+flagCcont; l<=Ccontgroup[Ccont+1]; l++) {    
      hint(DISABLE_DEPTH_TEST);
      display3[l].setSettings(size+map(freq, 0, 1024, 0, 255),size2, modulo, inc, colormanual, hue, sat, bri, trans, Bsize, Bhue, Bsat, Bbri, Btrans, israndom, npoints,starorpoly,speedX,speedY);     
      //Ccon++;
    }
    for (int i=0; i< cont; i++) {
      display3[i].display(); 
      display3[i].move();
    }
  }
  
   else if (displaymode == 4) {  
     for (int i=0; i<=7; i++){
       for(int k=0; k<=7; k++){
         hint(DISABLE_DEPTH_TEST);
          display4[i][k].setSettings(size+map(freq, 0, 1024, 0, 255),size2, modulo, inc, colormanual, hue, sat, bri, trans, Bsize, Bhue, Bsat, Bbri, Btrans, israndom, npoints,starorpoly,speedX,speedY);
          float xpos = map(k,0,8,0,width) ;
          float ypos = map(i,0,8,0,height) ;
          display4[i][k].setPos(xpos +(width/16) ,ypos+(height/16));
          if ( showdisplay4[k][i]){
          display4[i][k].display();
          }
       }
     }
  }
  
  else if (displaymode == 5) {  
    hint(DISABLE_DEPTH_TEST);
     for (int k=1; k<=Cantobj; k++){
       display5[k].setSettings(size+map(freq, 0, 1024, 0, 255),size2, modulo, inc, colormanual, hue, sat, bri, trans, Bsize, Bhue, Bsat, Bbri, Btrans, israndom, npoints,starorpoly,speedX,speedY);
       display5[k].display();
     }
  }  
  spout.sendTexture();
 
}

void stop()
{
  // always close Minim audio classes when you are done with them
  spout.closeSpoutControls();
  in.close();
  minim.stop();
  super.stop();
}