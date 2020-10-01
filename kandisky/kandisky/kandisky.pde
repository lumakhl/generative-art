int heightSize, widthSize; 
boolean isDark;
color baseColor;
int perimeterSize;

void setup() {
  background(baseColor);

  drawContour();
}

public void settings() {
  heightSize = int(random(500, 800));
  widthSize = int(random(500, 1000));

  configBaseColor();
  
  size(widthSize, heightSize);
  perimeterSize = width/2;
  initialize();
}

void draw() {
  center();
  rightEdge();
  leftEdge();
  bottomEdge();
  
  save("kandisky-cinco-"+random(1000)+"png");
  noLoop();
  
  //refresh();
}

void refresh() {
  configBaseColor();
  background(baseColor);
  drawContour();
  initialize();
}
