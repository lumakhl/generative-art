import processing.opengl.*;

float xstart, ystart,zstart;
float xnoise,ynoise, znoise;

int sideLength = 200;
int spacing = 5;

void setup() {
  size(500, 300, P3D);
  background(0);
  sphereDetail(8);
  noStroke();
  
  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}

void draw() {
  background(0);
  
  xstart += 0.01;
  ystart += 0.01;
  zstart += 0.01;
  
  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;
  
  translate(150, 20, -150);
  rotateZ(frameCount * 0.1);
  rotateY(frameCount * 0.1);
  
 for (int z = 0; z <= height; z+=5) {
    znoise += 0.1;
    ynoise = ystart;
    for (int y = 0; y <= height; y+=5) {
      ynoise += 0.1;
      xnoise = xstart;
    
      for(int x = 0; x <= width; x+=5) {
        xnoise += 0.1;
        drawPoint(x,y,z,noise(xnoise, ynoise));
      }
    } 
  }
}

void drawPoint(float x, float y,float z,float noiseFactor) {
  pushMatrix();
  translate(x, y, z);
  float grey = 255 * noiseFactor;
  fill(grey, 10);
  box(spacing, spacing, spacing);
  popMatrix();
}
