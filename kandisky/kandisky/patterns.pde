void shadowCircle(float cx, float cy, float cr, color shadowColor, color formColor) {
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
  int r,g,b;
  
  translate(centerX, centerY);
  rotate(radians(rotAngle));
  fill(fillColor, transparency);
  
  for(int i=0; i<numOfArcs; i++) {
    r = (i%30)*40+130;
    g = (i+1)%3*75;
    b = (i+2)%3*25;
    
    strokeWeight(4);
    stroke(r,g,b);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);
    
    strokeWeight(1);
    stroke(0);
    arc(offsetX, 0, largeRadius-i*inc, largeRadius-i*inc, PI, TWO_PI);
    
    offsetX += largeRadius-i*inc;
    if(inc>0) offsetX -= 4;
  }
  strokeWeight(0);
  rotate(radians(-rotAngle));
  translate(-centerX, -centerY);
}

void closedGrade(int centX, int centY) {
  int columns = int(random(3,10));  //<>//
  int lines = int(random(3,10));
  int columnHeight = int(random(10,50));
  int columnWidth = int(random(10,50));
  int rotation = int(random(360));
  
  int p1 = 0;
  int p2 = 0;
  
  strokeWeight(3);
  stroke(0);
   //<>//
  push();
  translate(centX, centY);
  
  for(int x=0; x < columns; x++) { //<>// //<>//
    for (int y=0; y < lines; y++) {
      if (randomSignum() == -1) {
        color co = color(random(255));
        fill(co);
      } else {
        noFill();
      }
      rect(centX+p1, centY+p2,  columnWidth, columnHeight);
      p1 += columnWidth; //<>//
    }
    p1 = 0;
    p2 += columnHeight; 
  }
    
}
