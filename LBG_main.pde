//////////////////////////////////////
//  Lightning Bug Game - Main Code  // 
//  Kaho Abe                        //
//////////////////////////////////////
//  This goes on my computer MBPro  //
//  Communicates with phone1 and    // 
//  phone2.                         //
//////////////////////////////////////

///////////VARIABLES TO SET////////////
String phoneName1 = "/PHONE1";//"/PHONE1";**with Slash
String phoneName2 = "/PHONE2";//"/PHONE2";**with Slash

/////////////GAME states/////////////
int state = 0; 
// state = 0 is REST MODE
// state = 1 is STORY MODE
// state = 2 is BLACKOUT MODE
// state = 3 is GAME MODE

///////////LIBRARIES////////////////
import oscP5.*;
import netP5.*;
 

///////////VARIABLES////////////////
int W = 180;
int WIDTH = 720-W;
int HEIGHT = 405;
int NUM = 128;
 
OscP5 oscP5;

float lightValue1;
ArrayList<Float> AValue1 = new ArrayList<Float>();

float lightValue2;
ArrayList<Float> AValue2 = new ArrayList<Float>();
 
void setup() {
   
    size(1280, 800, OPENGL);
    noStroke();
     
     
    for(int i = 0; i < 3; i++){
      AValue1.add(new Float(0));
    }
    
    for(int i = 0; i < 3; i++){
      AValue2.add(new Float(0));
    }
    oscP5 = new OscP5(this,12000);
  
    setConsole();
     
}
 
void draw() {
   
  background(0);
  noStroke();

   
  String info = "";
  info += "lightValue:"+lightValue1+"\n";
  info += "AccelerometerX:"+AValue1.get(0)+"\n";
  info += "AccelerometerY:"+AValue1.get(1)+"\n";
  info += "AccelerometerZ:"+AValue1.get(2)+"\n";
  info += "====================================\n";
  info += "lightValue:"+lightValue2+"\n";
  info += "AccelerometerX:"+AValue2.get(0)+"\n";
  info += "AccelerometerY:"+AValue2.get(1)+"\n";
  info += "AccelerometerZ:"+AValue2.get(2)+"\n";
 
  drawConsole(info);
   
}
 
void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern(phoneName1) == true) {
    //if(theOscMessage.checkTypetag("fffffffffff")) {
      lightValue1 = theOscMessage.get(0).floatValue();
      AValue1.set(0,theOscMessage.get(1).floatValue());
      AValue1.set(1,theOscMessage.get(2).floatValue());
      AValue1.set(2,theOscMessage.get(3).floatValue());    
   // }
  }
  if(theOscMessage.checkAddrPattern(phoneName2) == true) {
   // if(theOscMessage.checkTypetag("fffffffffff")) {
      lightValue2 = theOscMessage.get(0).floatValue();
      AValue2.set(0,theOscMessage.get(1).floatValue());
      AValue2.set(1,theOscMessage.get(2).floatValue());
      AValue2.set(2,theOscMessage.get(3).floatValue());
    //}
  }
}
