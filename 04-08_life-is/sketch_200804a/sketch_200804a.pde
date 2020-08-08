float xstart, xnoise, ystart, ynoise;

void setup() {
  size(800,800);
  smooth();
  background(0);
  
  frameRate(24);
  
  xstart = random(10);
  ystart = random(10);
}

void draw() {
  background(0);
  
  xstart += 0.01;
  ystart += 0.01;
  
  xnoise = xstart;
  ynoise = ystart;
  
  for(int y=0; y <= height; y +=2) {
    ynoise += 0.1;
    xnoise = xstart;
    
    for(int x = 0; x <= width; x +=25) {
      xnoise += 0.1;
      drawPoint(x,y, noise(xnoise, ynoise));
    }
  }
  noLoop();
  save(random(1000)+".png");
}

void drawPoint(float x, float y, float noiseFactor){
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor*radians(360));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor * 20);
  float alph = 150 + (noiseFactor * 20);
  fill(grey, alph);
  ellipse(0,0, edgeSize, edgeSize/2);
  popMatrix();
}
