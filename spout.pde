void iniciarspout(){
  spout = new Spout(this);
  
  sendername = "Spyrographics";
  //spout.initSender(sendername, width, height);
  spout.createSender(sendername, width, height);
 
  controlName = new String[20];
  controlType = new int[20];
  controlValue = new float[20];
  controlText = new String[20];
  
  //pepe.initSender(sendername, width, height);
   spout.openSpoutControls(sendername);
  
}

void ControlesSpout(){
  int nControls = spout.checkSpoutControls(controlName, controlType, controlValue, controlText);
  //print("nControls = " + nControls + "n");
  if (nControls > 0) {
    for (int i = 0; i < nControls; i++) {
       //print("(" + i + ") : [" + controlName[i] + "] : Type [" + controlType[i] + "] : Value [" + controlValue[i] + "] : Text [" + controlText[i] + "]" + "n");
  
      if (controlName[i].equals("Size")) {
          size = controlValue[i];
      }
      if (controlName[i].equals("Size2")) {
          size2 = controlValue[i];
      }
      if (controlName[i].equals("modulo")) {
          modulo = controlValue[i];
      }
      if (controlName[i].equals("Rotation Speed")) {
          inc = controlValue[i];
      }
      if (controlName[i].equals("hue")) {
          hue = controlValue[i];
      }
      if (controlName[i].equals("sat")) {
          sat = controlValue[i];
      }
      if (controlName[i].equals("bri")) {
          bri = controlValue[i];
      }
      if (controlName[i].equals("trans")) {
          trans = controlValue[i];
      }
      if (controlName[i].equals("Bhue")) {
          Bhue = controlValue[i];
      }
      if (controlName[i].equals("Bsat")) {
          Bsat = controlValue[i];
      }
      if (controlName[i].equals("Bbri")) {
          Bbri = controlValue[i];
      }
      if (controlName[i].equals("Btrans")) {
          Btrans = controlValue[i];
      }
      if (controlName[i].equals("X speed")) {
          speedX = controlValue[i];
      }
      if (controlName[i].equals("Y speed")) {
          speedY = controlValue[i];
      }
       if (controlName[i].equals("Bsize")) {
          Bsize = controlValue[i];
      }
      if (controlName[i].equals("Sonido")) {
          soundsensibility = controlValue[i];
      }
      if (controlName[i].equals("BGrefresh")){
        isbackground = (boolean)(controlValue[i] == 1);
      }
      if (controlName[i].equals("RandomPoints")){
         israndom =  (boolean)(controlValue[i] == 1);
      }
      if (controlName[i].equals("Npoints")) {
          npoints = parseInt(controlValue[i]);
      }
      if (controlName[i].equals("StarOrPolygon")){
        starorpoly = (boolean)(controlValue[i] == 1);
      }
    }
  } 
  
  
  
}