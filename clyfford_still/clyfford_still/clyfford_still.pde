import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;
PGraphics canvas;

void setup() {
  size(800, 800, P3D);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  fx = new PostFX(this);
  smooth(300);

  config();
}

void draw() {
  float colorBackground = random(1000);
  if (colorBackground >= 500) {  
    background(0);
  } else { 
    background(255);
  }

  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }

  translate(_cellSize/2, _cellSize/2);

  float xnoise = 0.0;
  float ynoise = 0.0;
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      float n = noise(xnoise, ynoise, znoise) * 256;
      _cellArray[x][y].drawMe(n);
      xnoise += inc;
    }
    xnoise = 0;
    ynoise += inc;
  }
  znoise += inc;

  String title = "clyfford-oil1"+random(1000);
  save(title+".png");
  PImage img = loadImage(title+".png");

  saveWithFilter(img);
  oilPaintingFilter(img);

  fx.render()
    .noise(0.1, 0.1)
    .compose();

  save(title+"-novo-oil"+".png");
  config();
  // noLoop();
}

void mousePressed() {
  config();
}
