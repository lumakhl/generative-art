int heightSize, widthSize; 
boolean isDark;
color baseColor;
int perimeterSize;

void setup() {
  println("valor: "+ widthSize, heightSize);
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
}

void draw() {
  color c1 = color(random(255), random(255), random(255));
  color c2 = color(random(255), random(255), random(255));

  //shadowCircle(random(width), random(height), random(width/8, width/4), c1, c2);
  //stripedCircle(random(width), random(height), random(width/8, width/4), c1);
  //arcs( int(random(width)), int(random(height)), 3, 60, 60, 9, 10, 45);
  //closedGrade(width/2, height/2);
  //groupedLine(width/2, height/2);
  //curvedLine(width/2, height/2);
  //eyebrow(width/2, height/2);
  //semiCircle(width/2, height/2); 
  cutedLine(width/2, height/2);


   noLoop();
  // println("valor: "+ randomSignum());
  // println("valor: "+ widthSize, heightSize);
}
