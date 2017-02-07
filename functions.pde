
void iniciarMinim(){
  
  //SONIDO : 
  minim = new Minim(this);
 // minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  
  freq = abs( in.left.get(250)*1024 ) ;
}