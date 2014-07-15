///////////VARIABLES TO SET////////////
String phoneName1 = "/PHONE1";//"/PHONE1";**with Slash
String phoneName2 = "/PHONE2";//"/PHONE2";**with Slash
String phone1IP = "10.0.1.4";//blackout Msg = 0  //shoot Msg = 1  //power Msg = 2 
String phone2IP = "10.0.1.3";
boolean firing= false;

final int TANK_NOT_FULL = 0;
final int TANK_EMPTY = 1;
final int TANK_FULL = 2;

///////////LIBRARIES////////////////
import oscP5.*;
import netP5.*;
OscP5 oscP5, getMouse;
int lazX, lazY;
NetAddress phone1;
NetAddress phone2;
//////////////FUNCTIONS////////////////

void setupOSC() {
  oscP5 = new OscP5(this, 11000); 
  phone1 = new NetAddress(phone1IP, 12001);  
  phone2 = new NetAddress(phone2IP, 12001);  
  getMouse = new OscP5(this, 11000);
}

//void sendOSC(){
//  //uses OSC to send values to Laptop
//  OscMessage sendValue = new OscMessage(laptop);
//  sendValue.add("hello");
//  oscP5.send(sendValue, phoneName1);  
//  oscP5.send(sendValue, phoneName2);  
//}


void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern(phoneName2) == true) {
    //if(theOscMessage.checkTypetag("i")) {
    phoneVal2 = theOscMessage.get(0).intValue();  
    println("phoneVal2:" + phoneVal2);

    if (phoneVal2 == 1 && !alarm.isPlaying()) {
      alarm.rewind();
      alarm.play();
      println("empty");
    }
    else {

      alarm.pause();
    }
  } 
  if (theOscMessage.checkAddrPattern(phoneName1) == true) {
    //if (theOscMessage.checkTypetag("i")) {
      phoneVal1 = theOscMessage.get(0).intValue();  
      println("phoneVal1: " + phoneVal1);
   // }      

    if (phoneVal1 == 0 ||phoneVal2 == 1) {
      power.pause();
    }
    if (phoneVal1 == 2) {
      power.pause();
    }
    if (phoneVal1 == 1 && phoneVal2 == 0) {

      power.rewind();
      power.play();
      println("power");
    }
    if (phoneVal1 == 3 && phoneVal2 == 0) {
      power.pause();
      shoot.trigger();
      println("shoot");
      firing = true;
      shootCounter =0;
    }
  }
  //FOR THE LAZER
  if (theOscMessage.checkAddrPattern("/pointer")) {

    lazX = theOscMessage.get(0).intValue();
    lazY = theOscMessage.get(1).intValue();

    //     println("lazer: "+lazX+" "+lazY);
  }
}

