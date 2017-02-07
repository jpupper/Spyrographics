
class ControlFrame extends PApplet {
 
  int w, h;
  PApplet parent;
  ControlP5 cp5;
 
  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
 
  public void settings() {
    size(w, h, P3D);
  }
 
  public void setup() {
    int sep = 20;
    cp5 = new ControlP5(this);
    cp5.addSlider("size").setPosition(40,sep).setRange(0,1200).plugTo(parent,"size");
    cp5.addSlider("modulo").setPosition(40,sep*2).setRange(0,200).plugTo(parent,"modulo");
    cp5.addSlider("inc").setPosition(40,sep*3).setRange(0,20).plugTo(parent,"inc");
    cp5.addSlider("hue").setPosition(40,sep*4).setRange(0,255).plugTo(parent,"hue");
    cp5.addSlider("sat").setPosition(40,sep*5).setRange(0,255).plugTo(parent,"sat");
    cp5.addSlider("bri").setPosition(40,sep*6).setRange(0,255).plugTo(parent,"bri");
    cp5.addSlider("trans").setPosition(40,sep*7).setRange(0,255).plugTo(parent,"trans");
    cp5.addSlider("Bsize").setPosition(40,sep*8).setRange(0,30).plugTo(parent,"Bsize");
    cp5.addSlider("Bhue").setPosition(40,sep*9).setRange(0,255).plugTo(parent,"Bhue");
    cp5.addSlider("Bsat").setPosition(40,sep*10).setRange(0,255).plugTo(parent,"Bsat");
    cp5.addSlider("Bbri").setPosition(40,sep*11).setRange(0,255).plugTo(parent,"Bbri");
    cp5.addSlider("Btrans").setPosition(40,sep*12).setRange(0,255).plugTo(parent,"Btrans");
    cp5.addSlider("sounsensibility").setPosition(40,sep*13).setRange(0,1200).plugTo(parent,"sounsensibility");
  }
 
}