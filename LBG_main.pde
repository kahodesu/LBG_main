//////////////////////////////////
//Lightning Bug Game - Main Code// 
//Kaho Abe                      //
//////////////////////////////////
//This goes on my computer MBPro//
//Communicates with phone1 and  // 
//phone2.                       //
//////////////////////////////////

import oscP5.*;
import netP5.*;
 
int W = 180;
int WIDTH = 720-W;
int HEIGHT = 405;
int NUM = 128;
 
OscP5 oscP5;
 
float lightValue;
//float scaleValue;
ArrayList<Float> AValue = new ArrayList<Float>();
//ArrayList<Float> GValue = new ArrayList<Float>();
ArrayList<Float> OValue = new ArrayList<Float>();
 
void setup() {
   
    size(720, 405, OPENGL);
    noStroke();
     

    for(int i = 0; i < 3; i++){
      AValue.add(new Float(0));
      OValue.add(new Float(0));
    }
    oscP5 = new OscP5(this,12000);

    setConsole();
     
}
 
void draw() {
   
  fill(0);
  noStroke();
  rect(0,0,WIDTH,HEIGHT);
   
  String info = "";

  info += "lightValue:"+lightValue+"\n";
  info += "AccelerometerX:"+AValue.get(0)+"\n";
  info += "AccelerometerY:"+AValue.get(1)+"\n";
  info += "AccelerometerZ:"+AValue.get(2)+"\n";
  info += "OrientationX:"+OValue.get(0)+"\n";
  info += "OrientationY:"+OValue.get(1)+"\n";
  info += "OrientationZ:"+OValue.get(2)+"\n";
  drawConsole(info);
   
  println(lightValue);

   
}
 
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/AndroidOSC") == true) {
    if(theOscMessage.checkTypetag("fffffffffff")) {
      
      lightValue = theOscMessage.get(1).floatValue();
      AValue.set(0,theOscMessage.get(2).floatValue());
      AValue.set(1,theOscMessage.get(3).floatValue());
      AValue.set(2,theOscMessage.get(4).floatValue());
      OValue.set(0,theOscMessage.get(8).floatValue());
      OValue.set(1,theOscMessage.get(9).floatValue());
      OValue.set(2,theOscMessage.get(10).floatValue());
    }
  }
}
