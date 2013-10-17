/////////////////////////////////////////////////
//  Lightning Bug Game - Laptop Code (MAIN)    // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on my laptop MBPro and communicates  //
//    with Phone1 and Phone2.                  //
//  *See README in LAPTOP code for references! //
/////////////////////////////////////////////////

/////////////GAME states/////////////
int state = 0; 
// state = 0 is REST MODE
// state = 1 is STORY MODE
// state = 2 is BLACKOUT MODE
// state = 3 is GAME MODE

///////////VARIABLES////////////////
int W = 180;
int WIDTH = 720-W;
int HEIGHT = 405;
int NUM = 128;
 

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
    setupOSC();  
    setConsole();
    setupTest();
     
}
 
void draw() {
   
  background(0);
  noStroke();
  drawTest();
  
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
 

