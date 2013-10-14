
PFont font;
 
void setConsole(){
  font = loadFont("Helvetica-12.vlw");

}
 
void drawConsole(String str){
  float H = W*0.75;
  int ts = 11;
  float X = width-W;
  float Y = height-H;
  
  fill(17);
  rect(X,0,W,Y);
   
  stroke(51);
  line(X,0,X,height);
  noStroke();
   
  fill(255);
  textSize(ts);
  textFont(font, ts);
  text(str,X+5,ts+5);
  text(str,X+5,ts+5);
}
