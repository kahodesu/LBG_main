///////////LIBRARIES////////////////
import oscP5.*;
import netP5.*;

///////////VARIABLES TO SET////////////
String phoneName1 = "/PHONE1";//"/PHONE1";**with Slash
String phoneName2 = "/PHONE2";//"/PHONE2";**with Slash

OscP5 oscP5;

//////////////FUNCTIONS////////////////
void setupOSC() {
  oscP5 = new OscP5(this,12000);   
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
