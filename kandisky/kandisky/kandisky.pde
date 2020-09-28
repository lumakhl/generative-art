int heightSize, widthSize; 
boolean isDark;
color baseColor;
int perimeterSize;

void setup() {
  background(baseColor);

  drawContour();

  noFill();
  noStroke();
  square(width/2-perimeterSize/2, height/2-perimeterSize/2, perimeterSize);
}

public void settings() {
  heightSize = int(random(500, 800));
  widthSize = int(random(500, 1000));

  isDark = randomSignum() == -1 ? true : false;
  baseColor = isDark ? darkBlue() : cream(); 

  size(widthSize, heightSize);
  perimeterSize = width/2;
  initialize();
}

void draw() {
  center();
  rightEdge();
  leftEdge();

  //shadowCircle(random(width), random(height));
  //stripedCircle(random(width), random(height));
  //arcs( int(random(width)), int(random(height)), 3, 60, 60, 9, 10, 45);
  //closedGrade(width/2, height/2);
  //groupedLine(width/2, height/2);
  //curvedLine(width/2, height/2);
  //eyebrow(width/2, height/2);
  //semiCircle(width/2, height/2); 
  //cutedLine(width/2, height/2);
  //simpleLine(width/2, height/2);
  //darkTriangle(int(random(width)), int(random(height)));
  //trapeze(width/4, height/4);
  //triangle(width/2, height/2);
  //doubleTriangle(width/2, height/2);
  //colorTriangle(width/2, height/2);
  //flag(int(random(width/2)), int(random(height/2)));
  //colorTrapeze(width/2, height/2);
  //groupedTriangleLine(width/2, height/2);
  //square(width/2, height/2);
  //darkSquare(width/2, height/2);

   noLoop();
}
