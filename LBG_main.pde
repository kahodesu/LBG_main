//////////////////////////////////
//Lightning Bug Game - Main Code// 
//Kaho Abe                      //
//////////////////////////////////
//This goes on my computer MBPro//
//Communicates with phone1 and  // 
//phone2.                       //
//////////////////////////////////

//import saito.objloader.*;
import oscP5.*;
import netP5.*;
 
int W = 180;
int WIDTH = 720-W;
int HEIGHT = 405;
int NUM = 128;
 
OscP5 oscP5;
//OBJModel objm;
 
float lightValue1;
float scaleValue1;
ArrayList<Float> AValue1 = new ArrayList<Float>();
ArrayList<Float> GValue1 = new ArrayList<Float>();
ArrayList<Float> OValue1 = new ArrayList<Float>();

float lightValue2;
float scaleValue2;
ArrayList<Float> AValue2 = new ArrayList<Float>();
ArrayList<Float> GValue2 = new ArrayList<Float>();
ArrayList<Float> OValue2 = new ArrayList<Float>();
 
void setup() {
   
    size(720, 405, OPENGL);
    noStroke();
     
    scaleValue1 = 40;
     scaleValue2 = 40;
     
    for(int i = 0; i < 3; i++){
      AValue1.add(new Float(0));
      GValue1.add(new Float(0));
      OValue1.add(new Float(0));
    }
    
    for(int i = 0; i < 3; i++){
      AValue2.add(new Float(0));
      GValue2.add(new Float(0));
      OValue2.add(new Float(0));
    }
    oscP5 = new OscP5(this,12000);
     
   // objm = new OBJModel(this);
   // objm.load("Android3D.obj");
    setConsole();
     
}
 
void draw() {
   
  fill(0);
  noStroke();
  rect(0,0,WIDTH,HEIGHT);
   
  String info = "";
  info += "scaleValue:"+scaleValue1+"\n";
  info += "lightValue:"+lightValue1+"\n";
  info += "AccelerometerX:"+AValue1.get(0)+"\n";
  info += "AccelerometerY:"+AValue1.get(1)+"\n";
  info += "AccelerometerZ:"+AValue1.get(2)+"\n";
  info += "GyroscopeX:"+GValue1.get(0)+"\n";
  info += "GyroscopeY:"+GValue1.get(1)+"\n";
  info += "GyroscopeZ:"+GValue1.get(2)+"\n";
  info += "OrientationX:"+OValue1.get(0)+"\n";
  info += "OrientationY:"+OValue1.get(1)+"\n";
  info += "OrientationZ:"+OValue1.get(2)+"\n";
  info += "====================================\n";
 // drawConsole(info);
  
  //  String info = "";
  info += "scaleValue:"+scaleValue2+"\n";
  info += "lightValue:"+lightValue2+"\n";
  info += "AccelerometerX:"+AValue2.get(0)+"\n";
  info += "AccelerometerY:"+AValue2.get(1)+"\n";
  info += "AccelerometerZ:"+AValue2.get(2)+"\n";
  info += "GyroscopeX:"+GValue2.get(0)+"\n";
  info += "GyroscopeY:"+GValue2.get(1)+"\n";
  info += "GyroscopeZ:"+GValue2.get(2)+"\n";
  info += "OrientationX:"+OValue2.get(0)+"\n";
  info += "OrientationY:"+OValue2.get(1)+"\n";
  info += "OrientationZ:"+OValue2.get(2)+"\n";
  drawConsole(info);
   
  println(lightValue1);
  println(lightValue2);
 // ambientLight(200,100,100);
 // directionalLight(255,255,100,-1,0,0);
 // pointLight(100,200,255, 100, 100, 100);
 // spotLight(lightValue,lightValue,lightValue, 100, 100, 1000, 0, 0, -1, PI, 2);
   
//  translate(WIDTH/2,HEIGHT/2,1);
//  rotateX(GValue.get(0)*-1);
//  rotateY(GValue.get(1));
//  rotateZ(GValue.get(2)*-1);
 // scale(scaleValue);
 // objm.draw();
   
}
 
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/AndroidOSC1") == true) {
    if(theOscMessage.checkTypetag("fffffffffff")) {
      float pinchValue1 = theOscMessage.get(0).floatValue();
      if(pinchValue1>2){
        scaleValue1++;
      }
      if(pinchValue1 < -2){
        scaleValue1--;
      }
      if(scaleValue1 < 1){
        scaleValue1 = 1;
      }
      lightValue1 = theOscMessage.get(1).floatValue();
      AValue1.set(0,theOscMessage.get(2).floatValue());
      AValue1.set(1,theOscMessage.get(3).floatValue());
      AValue1.set(2,theOscMessage.get(4).floatValue());
      GValue1.set(0,theOscMessage.get(5).floatValue());
      GValue1.set(1,theOscMessage.get(6).floatValue());
      GValue1.set(2,theOscMessage.get(7).floatValue());
      OValue1.set(0,theOscMessage.get(8).floatValue());
      OValue1.set(1,theOscMessage.get(9).floatValue());
      OValue1.set(2,theOscMessage.get(10).floatValue());
    }
  }
  if(theOscMessage.checkAddrPattern("/AndroidOSC2") == true) {
    if(theOscMessage.checkTypetag("fffffffffff")) {
      float pinchValue2 = theOscMessage.get(0).floatValue();
      if(pinchValue2>2){
        scaleValue2++;
      }
      if(pinchValue2 < -2){
        scaleValue2--;
      }
      if(scaleValue2 < 1){
        scaleValue2 = 1;
      }
      lightValue2 = theOscMessage.get(1).floatValue();
      AValue2.set(0,theOscMessage.get(2).floatValue());
      AValue2.set(1,theOscMessage.get(3).floatValue());
      AValue2.set(2,theOscMessage.get(4).floatValue());
      GValue2.set(0,theOscMessage.get(5).floatValue());
      GValue2.set(1,theOscMessage.get(6).floatValue());
      GValue2.set(2,theOscMessage.get(7).floatValue());
      OValue2.set(0,theOscMessage.get(8).floatValue());
      OValue2.set(1,theOscMessage.get(9).floatValue());
      OValue2.set(2,theOscMessage.get(10).floatValue());
    }
  }
}
