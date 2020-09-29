void center() {
  for (CENTRAL_PATTERNS pattern : central_patterns) {
    int centX = int(random(width/2-perimeterSize/2, perimeterSize));
    int centY = int(random(height/2-perimeterSize/2, perimeterSize));
    drawMe(pattern, centX, centY);
  }
}

void rightEdge() {
  for (EDGE_PATTERNS pattern : edge_right) {
    int centX = int(random(width/2-perimeterSize/2+perimeterSize, width));
    int centY = int(random(0, height));
    drawMe(pattern, centX, centY);
  }
}

void leftEdge() {
  for (EDGE_PATTERNS pattern : edge_left) {
    int centX = int(random(0,width/2-perimeterSize/2));
    int centY = int(random(0, height));
    drawMe(pattern, centX, centY);
  }
}

void bottomEdge() {
  for (EDGE_PATTERNS pattern : edge_bottom) {
    int centX = int(random(0, width));
    int centY = int(random(height/2-perimeterSize/2+perimeterSize, height));
    drawMe(pattern, centX, centY);
  }
}

void upEdge() {
  for (EDGE_PATTERNS pattern : edge_up) {
    int centX = int(random(0, width));
    int centY = int(random(0, height/2-perimeterSize/2));
    drawMe(pattern, centX, centY);
  }
}
