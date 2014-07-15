float count = 5;
boolean up = true;
int transparency1=0;

float inc = 3;

void slideshow() {
  tint (255, 255); 
  image(img3, -120+count+random(5, -5), -100+count+random(5, -5));

  tint (255, count);
  image(img1, 100-count/2+random(5, -5), 100-count+random(5, -5));

  tint(180, 255-(count + 10));
  image(img2, -125+count, 0);

  count += inc;
//  println(count);
  
  if (count >= 255 || count <= 0) {
    inc *= -1;
    inc += random(-3, 3);
    if (abs(count) > 5) inc = random(-3, 3);
  }
}

