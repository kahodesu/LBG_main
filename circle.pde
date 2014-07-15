

class Ellipse
{
  int x, y;
  int clickedTime;
  int maxSize;
  int startSize;
  int intervalSize;
  int fColor;
  boolean dead;
  Ellipse (int _x, int _y, int _clickedTime, int _maxSize, int _startSize, int _intervalSize)
  {
    x = _x; 
    y = _y;
    clickedTime = _clickedTime;
    maxSize = _maxSize;
    startSize = _startSize;
    intervalSize = _intervalSize;

    fColor = color( (0), (0), (0) );
    dead = false;
  }

  String run()
  {
    //if(millis() < clickedTime + 100) return; // do nothing
    // lazX=1920-lazX;//FLIP IT
    if (dist(x, y, lazX, lazY) < 1.5*startSize   &&  firing == true) {

      fill(0, 255, 0); 
      dead = true;
   
    }
    else 
    {
      fill( fColor );
    }
    // if(dist(x, y, lazX, lazY) < 1.5*startSize   ) fill(0,255,0); else fill( fColor );//2 is Shoot   
    //   println("cir("+x+", "+y+")   laz("+lazX+", "+lazY+")    d: "+ dist(x, y, lazX, lazY) +" <?  s: "+startSize);
    ellipse(x, y, startSize + intervalSize, startSize + intervalSize); 
    startSize += intervalSize;
    clickedTime = millis();

    if (startSize> maxSize) {
      dead = true;
    }
    return(x+","+y);
  }
}


    return(x+","+y);
  }
}

