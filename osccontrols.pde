void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
 /* print("### received an osc message.");}
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());*/
  
   int res = parseInt(theOscMessage.addrPattern().substring(7,theOscMessage.addrPattern().length())) ;
   print(" addrpattern: "+theOscMessage.addrPattern());
   
      
   if (displaymode == 4){
   println("res :",res);
   //println("String lenght : ",theOscMessage.addrPattern().length());
  // println("I : ",I);
  // println("D : ",D);
  
   int L=0;
   for (int i = 0 ; i<=7; i++){
       for (int k = 0 ; k<=7; k++) {
         
        
         if (L == res){
          println("CAMBIO : ",L);
         showdisplay4[k][i] = !showdisplay4[k][i];
         
         }
         L++;
           println("showdisplay4[",i,"][",k,"] : ",showdisplay4[k][i]);
           println("L : ",L);
       }
      
         
         println("");
   }
   println(theOscMessage.addrPattern());
  // println(theOscMessage.addrPattern().charAt(7));
   }
   
   if (displaymode == 5){
    
      //int res = parseInt(theOscMessage.addrPattern().substring(7,theOscMessage.addrPattern().length())) ;
      println(" addrpattern: "+theOscMessage.addrPattern());
      println("Variable X:",theOscMessage.get(1).floatValue());
      println("Variable Y:",theOscMessage.get(0).floatValue());
      
      float xpos = theOscMessage.get(1).floatValue();
      float ypos = theOscMessage.get(0).floatValue();
      
      xpos = map(xpos,0,1,0,width);
      ypos = map(ypos,1,0,0,height);
      
      display5[res].setPos(xpos,ypos);
   }
   
}