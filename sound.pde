import ddf.minim.*;

Minim minim;
//AudioSample power;
AudioSample shoot;
AudioPlayer power;
AudioPlayer alarm;


void setupSound() {
  minim = new Minim(this);
 // player = minim.loadFile("marcus_kellis_theme.mp3");
  power = minim.loadFile( "power.wav");
   alarm = minim.loadFile( "alarm.mp3");
  shoot = minim.loadSample( "shoot.wav");
  
}

void keyPressed() 
{
//  if ( key == 's' ) power.trigger();
  if ( key == 'k' ) shoot.trigger();
}

void stop(){
  
  
  
}

