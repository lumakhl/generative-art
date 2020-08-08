

class Star{
  int x;
  int y;
  int radius;
  
  public Star(){
    this.x = int(random(0,800));
    this.y = int(random(0,600));
    this.radius = int(random(10, 100));
  }
}

ArrayList<Star> estrelas = new ArrayList<Star>();

void criarEstrelas() {
  for(int i = 0; i <= 5; i++) {
  estrelas.add(new Star());
}
}

float xstart, xnoise, ynoise;
void setup() {
  size(800,800);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  
  criarEstrelas();

  for(int y = 0; y <= height; y+=5){
    ynoise += 0.1;
    xnoise = xstart;
    
    checkSky(y);
  
    for(int x =0; x <= width; x+=5) {
      xnoise += 0.1;
      
      if (isCircle(x,y)) {
        stroke(200, 150, 0);
      } else {
         checkSky(y);
      }
      
      drawPoint(x,y, noise(xnoise, ynoise));

    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(360));
  line(0,0,20,0);
  popMatrix();
}

boolean isCircle(int x, int y) {
  for(Star star : estrelas) {
    if (!(dist(star.x,star.y,x, y)>star.radius)){
      return true;
    }
  };
  return false; 
}

void checkSky(int y) {
   if (y > (600)) {
     strokeWeight(4);
      stroke(0,random(255));
    } else {
           strokeWeight(1);
       stroke(0, 0, random(100,255));
    }
}
  
