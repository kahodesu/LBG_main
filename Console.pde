
PFont font;
 
void setConsole(){
  font = loadFont("Helvetica-12.vlw");
  int W = 180;
  int WIDTH = 720-W;
  int HEIGHT = 405;
  int NUM = 128;

}
 
void drawConsole(String str){

  
  float H = W*0.75;
  int ts = 11;
   float X = 0;
  float Y = 0;
 // float X = width-W;
 // float Y = height-H;
  
  fill(17);
   
  stroke(51);
  line(X,0,X,height);
  noStroke();
   
  fill(255);
  textSize(ts);
  textFont(font, ts);
  text(str,width*0.5,height * 0.5);
 
}
