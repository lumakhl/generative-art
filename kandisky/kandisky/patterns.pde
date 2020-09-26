void shadowCircle(float cx, float cy, float cr, color shadowColor, color formColor) { //<>// //<>// //<>//
  float shadowSize = cr+random(50, 100);

  fill(shadowColor, 56);
  ellipse(cx, cy, shadowSize, shadowSize);
  fill(formColor);

  if (randomSignum() != -1) {
    stroke(0);
    strokeWeight(random(1, 3));
  }
  ellipse(cx, cy, cr, cr);
}

void circle(float cx, float cy, float cr, color formColor) {
  if (randomSignum() != -1) {
    stroke(0);
    strokeWeight(random(1, 3));
  }
  fill(formColor);
  ellipse(cx, cy, cr, cr);
}

void stripedCircle(float cx, float cy, float cr, color formColor) {

  float lenght = random(width/8, width/4);

  stroke(0);
  line(cx-lenght-45, cy-lenght-45, cx+lenght+45, cy+lenght+45);
  line(cx-lenght-45, cy+lenght+45, cx+lenght+45, cy-lenght-45);

  if (randomSignum() != -1) {
    stroke(0);
    strokeWeight(random(1, 3));
  } else {
    noStroke();
  }
  fill(formColor);
  ellipse(cx, cy, cr, cr);
}

void arcs(int centerX, int centerY, int numOfArcs, int largeRadius, int smallRadius, int fillColor, int transparency, int rotAngle) {
  int inc = (largeRadius - smallRadius)/numOfArcs;
  int offsetX = 0;
  int r, g, b;

  translate(centerX, centerY);
  rotate(radians(rotAngle));
  fill(fillColor, transparency);

  for (int i=0; i<numOfArcs; i++) {
    r = (i%30)*40+130;
    g = (i+1)%3*75;
    b = (i+2)%3*25;

    strokeWeight(4);
    stroke(r, g, b);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);

    strokeWeight(1);
    stroke(0);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);

    offsetX += largeRadius-i*inc;
    if (inc>0) offsetX -= 4;
  }
  strokeWeight(0);
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY);
}

void closedGrade(int centX, int centY) {
  int columns = int(random(3, 10)); 
  int lines = int(random(3, 10));
  int columnHeight = int(random(10, 50));
  int columnWidth = int(random(10, 50));
  int rotation = int(random(360));

  int p1 = 0;
  int p2 = 0;

  strokeWeight(3);
  stroke(0);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  for (int x=0; x < columns; x++) {
    for (int y=0; y < lines; y++) {
      if (randomSignum() == -1) {
        color co = color(random(255));
        fill(co);
      } else {
        noFill();
      }
      rect(p1, p2, columnWidth, columnHeight);
      p1 += columnWidth;
    }
    p1 = 0;
    p2 += columnHeight;
  }  
  popMatrix();  
  noFill();
  noStroke();
}

void openedGrid(int centX, int centY) {
  int columns = int(random(3, 10)); 
  int lines = int(random(3, 10));

  int rotation = int(random(360));

  strokeWeight(3);
  stroke(0);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  int lastX = 0;
  int lastY = 0;

  for (int x = 0; x < lines; x++) {
    line(0, lastY, +110, lastY);
    lastY += 15;
  }

  for (int y = 0; y < columns; y++) {
    lastX += 100/columns;
    line(lastX, 0-25, lastX, +100+10);
  }

  popMatrix();  
  noFill();
  noStroke();
}

void groupedLine(int centX, int centY) {
  int space = int(random(10, 50));
  int rotation = int(random(360));
  int quantity = 3;

  int lineHeight = int(random(10));
  int lineWidth = int(random(100, 200));

  stroke(0);
  strokeWeight(random(10));
  fill(0);


  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  int lastPosition = 0;
  for (int x = 0; x < quantity; x++) {
    rect(0, lastPosition, lineWidth, lineHeight);
    lastPosition += lineHeight + space;
  }

  popMatrix();
}

void groupedTriangleLine(int centX, int centY) {
  int size = int(random(100, 200));
  int quantity = int(random(3, 6));
  float rotation = random(360);
  int space = 20;

  strokeWeight(3);
  stroke(0);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  int lastX = -space;
  for (int x = 0; x < quantity; x++) {
    line(lastX, size, 0, 0);
    lastX += space;
  }
  popMatrix();
}

void curvedLine(int centX, float centY) {
  float xstep = 0.5;
  float lastx = -999;
  float lasty = -999;
  float angle = 0;
  float len = 480;

  float largura = 20;

  float y = centY;
  strokeWeight(largura);
  stroke(0);

  float curve = 100;
  pushMatrix();
  scale(0.5);

  for (float x=centX; x <= centX+len; x+= xstep) {
    float rad = radians(angle);
    centY = 50 + (cos(rad)*curve)+y;
    curve -= 0.1;
    if (lastx > -999) {
      strokeWeight(largura);
      line(x, centY, lastx, lasty);
      largura = largura <= 0.5 ? 1 : largura - 0.02;
    }
    lastx = x;
    lasty = centY;
    angle++;
  }

  popMatrix();
}

void cutedLine(int centX, int centY) {
  float lenght = random(height/4);
  float tLenght = lenght/4;
  float rotation = random(360);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  stroke(0);

  line(-lenght-45, -lenght-45, +lenght+45, +lenght+45);
  line(-tLenght-45, +80+tLenght+45, +80+tLenght+45, -tLenght-45);
  line(-tLenght-45, +120+tLenght+45, +120+tLenght+45, -tLenght-45);

  popMatrix();
}

void simpleLine(int centX, int centY) {
  float length = random(height/2);
  float rotation = random(360);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  strokeWeight(random(10, 30));
  strokeCap(SQUARE);
  stroke(0);
  line(0, 0, +length, +length);

  pushMatrix();
}

void eyebrow(int centX, int centY) {
  float radius = 100;

  float x, y;
  float lastX = 0;
  float lastY = 0;
  float largura = 20;

  stroke(0);
  strokeWeight(largura);

  for (float ang=225; ang <= 315; ang +=5) {
    float rad = radians(ang);
    x = centX + (radius*cos(rad));
    y = centY + (radius*sin(rad));

    if (ang == 225) {
      lastX = x;
      lastY = y;
    }

    if (ang == 225 || ang == 230 || ang == 315) {
      strokeCap(SQUARE);
    } else {
      strokeCap(ROUND);
    }

    strokeWeight(largura);
    line(x, y, lastX, lastY); 

    largura -= 0.5;
    lastX = x;
    lastY = y;
  }
}

void semiCircle(int centX, int centY) {
  float radius = 100;
  float x, y;
  float transparency = random(10, 170);

  noFill();
  stroke(0, 0, 0, transparency);
  strokeWeight(3);

  beginShape();
  for (float ang=180; ang <= 360; ang +=5) {
    float rad = radians(ang);
    x = centX + (radius*cos(rad));
    y = centY + (radius*sin(rad));

    curveVertex(x, y);
  }
  endShape();
}

void trapeze(int centX, int centY) {
  float lengthHorizontal = random(width/2);
  float lenghtVertical = random(height/2);
  float transparency = random(10, 170); 

  fill(random(255), random(255), random(255), transparency);

  noStroke();

  beginShape();
  vertex(centX, centY);
  vertex(centX+lengthHorizontal, centY);
  vertex(centX+lengthHorizontal, centY+lenghtVertical);
  vertex(centX-25, centY+lenghtVertical);
  endShape(CLOSE);
}

void colorTrapeze(int centX, int centY) {
  float lengthHorizontal = random(width/2);
  float lenghtVertical = random(lengthHorizontal) /2;
  float transparency = random(10, 170); 
  int divide =  int(random(2, 6));
  float rotation = random(360);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  fill(random(255), random(255), random(255), transparency);
  beginShape();
  vertex(0, 0);
  vertex(+lengthHorizontal, 0);
  vertex(+lengthHorizontal, +lenghtVertical);
  vertex(-25, +lenghtVertical);
  endShape(CLOSE);

  for (float i = divide; i > 0; i--) {
    float fator = i/divide;

    fill(random(255), random(255), random(255), transparency);
    noStroke();
    beginShape();
    vertex(lerp(0, +lengthHorizontal, fator), 0);
    vertex(+lengthHorizontal, 0);
    vertex(+lengthHorizontal, +lenghtVertical);
    vertex(lerp(0, +lengthHorizontal, fator), +lenghtVertical);
    endShape(CLOSE);
  }

  popMatrix();
}

void darkTriangle(int centX, int centY) {
  float lengthHorizontal = random(20, 30);
  float lenghtVertical = lengthHorizontal * random(10, 20);
  float rotation = random(360);

  fill(0);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  beginShape();
  vertex(0, 0);
  vertex(+lengthHorizontal, 0);
  vertex(+lengthHorizontal, +lenghtVertical);
  endShape(CLOSE);

  popMatrix();
}

void triangle(int centX, int centY) {
  float lengthHorizontal = random(width/2);
  float lengthVertical = random(height/2);

  float rotation = random(360);
  float transparency = random(10, 170);

  fill(random(255), random(255), random(255), transparency);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  noStroke();

  beginShape();
  vertex(0, 0);
  vertex(+lengthHorizontal, 0);
  vertex(+lengthHorizontal, +lengthVertical);
  endShape(CLOSE);

  popMatrix();
}

void doubleTriangle(int centX, int centY) {
  float lengthHorizontal = random(20, 30);
  float lengthVertical = lengthHorizontal * random(10, 20);

  float rotation = random(360);
  float transparency = random(10, 170);

  fill(random(255), random(255), random(255), transparency);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  beginShape();
  vertex(0, 0);
  vertex(+lengthHorizontal, 0);
  vertex(0, lengthVertical/4);
  vertex(+lengthHorizontal, lengthVertical/2);
  endShape();


  popMatrix();
}

void colorTriangle(int centX, int centY) {
  float lengthHorizontal = random(20, 30);
  float lengthVertical = lengthHorizontal * random(10, 20);
  int divide =  int(random(2, 6));

  float rotation = random(360);

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  for (float i = divide; i > 0; i--) {
    float fator = i/divide;

    fill(random(170), random(170), random(170));

    beginShape();
    vertex(lerp(lengthHorizontal, 0, fator), lerp(lengthVertical, 0, fator));
    vertex(lengthHorizontal, lerp(lengthVertical, 0, fator));
    vertex(lengthHorizontal, lengthVertical);
    endShape(CLOSE);
  }
  popMatrix();
}

void flag(int centX, int centY) {
  color c1 = color(random(255), random(255), random(255));
  color c2 = color(random(255), random(255), random(255));


  float divide = random(3, 6);
  int lineHeight = int(random(10));
  int lineWidth = int(random(100, 200));
  float rotation = random(360);

  noFill();

  pushMatrix();
  translate(centX, centY);
  rotate(radians(rotation));

  int lastPosition = 0;
  for (int x = 0; x < divide; x++) {
    stroke(0);  
    if (x%2 ==0) {
      fill(c1);
    } else {
      fill(c2);
    }

    rect(0, lastPosition, lineWidth, lineHeight);
    lastPosition += lineHeight;
  }

  popMatrix();
}
