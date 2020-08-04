float xstart, xnoise, ynoise;

void setup() {
  size(800,800);
  smooth();
  background(random(255), random(255), random(255));
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);

  for(int y = 0; y <= height; y+=25){
    ynoise += 0.1;
    xnoise = xstart;
  
    for(int x =0; x <= width; x+=15) {
      xnoise += 0.1;
    
      drawPoint(x,y, noise(xnoise, ynoise));    
    }
  }
  save(random(1000)+".png");
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  noStroke();
  fill(random(255), random(255), noiseFactor * 255, alph);
  triangle(0,0,edgeSize,edgeSize/2, edgeSize/4 * radians(800), 54);
  popMatrix();
}
