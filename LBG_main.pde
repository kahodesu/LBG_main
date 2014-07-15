import codeanticode.syphon.*;


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
final int SHOOT =2;
///////////VARIABLES////////////////
PImage img1, img2, img3;  // Declare variable "a" of type PImage

int W = 180;
int WIDTH = 720-W;
int HEIGHT = 405;
int NUM = 128;

float lightValue1;

int phoneVal2;
int phoneVal1;
PFont f;

int roulette = 0;
//ArrayList<Float> AValue1 = new ArrayList<Float>();
//
//float lightValue2;
//ArrayList<Float> AValue2 = new ArrayList<Float>();
Ellipse[] ellipses = new Ellipse[2];


//////syphon stuff/////
SyphonServer out;
int shootCounter = 0;

void setup() {

  size(1920, 1085, P3D);
  noStroke();

  //    for(int i = 0; i < 3; i++){
  //      AValue1.add(new Float(0));
  //    }
  //    
  //    for(int i = 0; i < 3; i++){
  //      AValue2.add(new Float(0));
  //    }
  setupOSC();  
  setConsole();
  setupSound();

  img1 = loadImage("sky1.jpg");  // Load the image into the program  
  img2 = loadImage("sky2.jpg");  // Load the image into the program  
  img3 = loadImage("sky3.jpg");  // Load the image into the program  
  img1.resize(round(img1.width*1.2), 0);
  img2.resize(round(img2.width*1.2), 0);
  img3.resize(round(img3.width*1.2), 0);

  // Create the font
  // println(PFont.list());
  f = createFont("LetterGothicStd-Bold", 200);
  textFont(f);
  state = 3;        
  out = new SyphonServer(this, "Lightning Bug");
}


void draw() {
  slideshow();
  roulette = int(random(50));
  //println ("random: "+ roulette);
  for (int i=0;i<ellipses.length;i++) {
    if (state == 3 && roulette == 1 && ellipses[i]==null ) {
      ellipses[i]=new Ellipse(round(random(width/15, 14*width/15)), round(random((height-5)/15, 14*(height-5)/15)), millis(), int(random(150, 350)), 10, 3);
    }
  }
  String info = "";

  for ( int i = 0; i<ellipses.length; i++ )
  {
    if (ellipses[i] != null) {
      info +=((Ellipse)ellipses[i]).run()+"\n"; 
      if (ellipses[i].dead) ellipses[i] = null;
    }
  }


  //=================================== 

  //====================================
  if (state == 0) { 


    //info += "PHONE1:"+phoneVal1+"\n";
    info += "PHONE2:"+phoneVal2+"\n";


    if (keyPressed) {
      if (key == 'a') {
        state =1;
        return;
      }
    }
  } 
  //--------------------------------------  
  else if (state == 1) {  


    // info += "PHONE1:"+phoneVal1+"\n";
//    info += "PHONE2:"+phoneVal2+"\n";
    info += "THIS IS STORY INTRO.\n";
    
    drawConsole(info);

    if (keyPressed) {
      if (key == 'a') {
        state = 2;
        return;
      }
    }
  }
  //--------------------------------------
  else if (state == 2) { 


    //  info += "PHONE1:"+phoneVal1+"\n";
    info += "PHONE2:"+phoneVal2+"\n";
    info += "THIS IS BLACK OUT MODE\n";
    if (keyPressed) {
      if (key == 'a') {
        state = 3;
      }
    } 

    //--------------------------------------
  }
  else if (state == 3) { 

    // info += "PHONE1:"+phoneVal1+"\n";
    info += "PHONE2:"+phoneVal2+"\n";
    info += "THIS IS GAME MODE";

    fill(120);
  }

  //  println("state: " + state); 

  fill(255);
  //drawConsole(info);


  // for diagnostics -- draws a white circle around the pointer
  pushStyle();
  noFill();
  strokeWeight(15);
  if (firing) {
    stroke(255, 0, 0, 50);
    for (int i=0;i<30;i++)
      ellipse (lazX+randomGaussian()*30, lazY+randomGaussian()*30, 6, 6);
  } 
  else {
    stroke(255, 50);
    for (int i=0;i<10;i++)
      ellipse (lazX+randomGaussian()*10, lazY+randomGaussian()*10, 6, 6);
  }
  
  if (firing == true) {
    shootCounter ++;
    if (shootCounter == 10) {
      firing = false; 
      shootCounter =0;
    }
  }
  popStyle();

  //OUTSIDE DOME
  if(phoneVal2 == TANK_EMPTY) {
    alarmFlash = !alarmFlash;
    if(alarmFlash) fill(255,0,0);
    else fill(255); 
  }
  else if(phoneVal2 == TANK_FULL) fill(0,255,0);
  else fill(0);
  rect(0, height-5, width, 5);

  out.sendImage(get()); //syphon output, sends PI Image (grabs image from draw to mad mapper)
}

// state = 0 is REST MODE
// state = 1 is INTRO MODE
// state = 2 is BLACKOUT MODE
// state = 3 is GAME MODE


boolean alarmFlash = false;
