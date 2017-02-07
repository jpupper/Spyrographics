class Spirograph {
 
   float x;
   float y;
   
   float xpos;
   float ypos;
   
   float angulo_fijo = 0;
   float angulo=0; 
   
   float size,modulo,inc;
   float size2;
   
   boolean colormanual;
   float hue, sat, bri, trans;
   
   float Bsize,  Bhue,  Bsat,  Bbri, Btrans ;
   
   boolean israndom = false;;
   int npoints = 8;
   
   //Booleanos que indican para que lado debe moverse
   boolean moveX;
   boolean moveY;
   boolean starorpoly;
   
   float speedX;
   float speedY;
 
   
   Spirograph(/*Variables de posición */ float tempxpos,float tempypos,
           /*Variables de movimiento */ float tempsize, float tempmodulo, float tempinc,
           /*Variables de color */ boolean tempcolormanual, float temphue, float tempsat, float tempbri, float temptrans,
           /*Variables del borde*/ float tempBsize, float tempBhue, float tempBsat, float tempBbri, float tempBtrans,
           /*Efecto random y puntas del poligono */ boolean tempisrandom, int tempnpoints  ){
             
   xpos = tempxpos;
   ypos = tempypos;
   size = tempsize;
   modulo = tempmodulo;
   inc = tempinc; 
   
   colormanual = tempcolormanual;
   hue = temphue;
   sat = tempsat;
   bri = tempbri;
   trans = temptrans;
   
   Bsize = tempBsize;
   Bhue = tempBhue;
   Bsat = tempBsat;
   Bbri = tempBbri;
   Btrans = tempBtrans;
   israndom = tempisrandom;
   npoints = tempnpoints;
  }
 
  void setSettings(float Csize,float _size2, float Cmodulo, float Cinc
                  ,boolean Ccolormanual,float Chue,float Csat,float Cbri, float Ctrans
                  ,float CBsize, float CBhue, float CBsat, float CBbri,float CBtrans
                  ,boolean Cisrandom,int Cnpoints,boolean _starorpoly,float _speedX,float _speedY){
   size = Csize;
   size2 = _size2;
   modulo = Cmodulo;
   inc = Cinc;

   colormanual = Ccolormanual;
   hue = Chue;
   sat = Csat;
   bri = Cbri;
   trans = Ctrans;
   
   Bsize = CBsize;
   Bhue = CBhue;
   Bsat = CBsat;
   Bbri = CBbri;
   Btrans = CBtrans;
   
   israndom =Cisrandom;
   npoints = Cnpoints;
   starorpoly = _starorpoly;
   
   
   speedX = _speedX;
   speedY = _speedY;
  }
  
  void display()
  {
    setBorde();
    setColor();
    pushMatrix();
    angulo_fijo+=inc; //Cuanto mayor sea inc, mas sera el efecto espirografico.
    angulo= angulo -10;
    x=(cos(radians(-(angulo)))*modulo);
    y=(sin(radians(-(angulo)))*modulo);
    
    translate(this.xpos - modulo +x, this.ypos -y);
    rotate(radians( angulo_fijo )); //Este rotate genera el efecto espirografico.
    if (keyPressed && key == 'k'){
     
      angulo = 0;
      angulo_fijo = 0;
    }
    
    if(israndom){
    //polygon(modulo+modulo/2,modulo-modulo/2,size,npoints);
    
      //star(modulo+modulo/2,modulo-modulo/2,size,size2,npoints);
      starOrpolygon(starorpoly);
     }
     else {
       //polygon(modulo+modulo/2,modulo-modulo/2,size,npoints);
       
     // star(modulo+modulo/2,modulo-modulo/2,size,size2,npoints);
      starOrpolygon(starorpoly);
     }
    popMatrix(); 
  }
  
  void setColor() {
     if (colormanual){
      fill(hue,sat,bri,trans);    
    }
    else{
      fill(col,255,255,trans);
      col++;
      if (col == 255) {
        col = 0 ; 
      }
    }  
  }
  void setPos(float tempxpos,float tempypos) {
    xpos = tempxpos;
    ypos = tempypos;
  }
  void move(){
    
      if (xpos >= width || xpos <= 0){
        moveX = !moveX; 
      }
      if (ypos >= height || ypos <= 0){
        moveY = !moveY; 
      }
      if (moveX){
        xpos += speedX;
      }
      else {
        xpos -= speedX;
      }
      if (moveY){
        ypos += speedY;
      }
      else {
        ypos -= speedY; 
      }
  }
  void setBorde(){
   stroke(Bhue,Bsat,Bbri,Btrans);
   strokeWeight(Bsize);
  }  
  void starOrpolygon(boolean starorpoly){
    
    if (starorpoly){
      star(modulo+modulo/2,modulo-modulo/2,size,size2,npoints);
      
     
    }
    
    else {
       polygon(modulo+modulo/2, modulo-modulo/2, size,npoints); 
    }
  }
  void polygon(float x, float y, float radius, int npoints) {
  if (npoints <= 1){
    if(israndom){
    ellipse(modulo+modulo/2,modulo-modulo/2,random(size),random(size));
    }
    else{
       ellipse(modulo+modulo/2,modulo-modulo/2,size,size);
    }  
  }
  if (npoints == 2 ) {
    strokeWeight(Bsize);
    line(modulo+modulo/2, modulo+modulo/2,size, size);
  }
  else if(npoints == 4){
    if(israndom){
    rect(modulo+modulo/2,modulo-modulo/2,random(size),random(size));
    }
    else{
       rect(modulo+modulo/2,modulo-modulo/2,size,size);
    }  
  }
  else {
     if(israndom){
      float angle = TWO_PI / npoints;
      beginShape();
        for (float a = 0; a < TWO_PI; a += angle) {
          float sx = x + cos(a) * radius;
          float sy = y + sin(a) * radius;
          vertex(random(sx), random(sy));
        }
      endShape(CLOSE);
      }
      else{
        float angle = TWO_PI / npoints;
        beginShape();
        for (float a = 0; a < TWO_PI; a += angle) {
          float sx = x + cos(a) * radius;
          float sy = y + sin(a) * radius;
          vertex(sx, sy);
        }
        endShape(CLOSE);
      }
    }  
  }
  
  void star(float x, float y, float radius1, float radius2, int npoints) {
    if (npoints == 1){
       npoints = 2; 
    }
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      if (israndom){
      vertex(random(sx), random(sy));
      }
      else{
       vertex(sx, sy); 
      }
      
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}