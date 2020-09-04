void setup() {
  size(800, 800);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  smooth(300);

  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  config();
}

void draw() {
  background(0);

  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }

  translate(_cellSize/2, _cellSize/2);

  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].drawMe();
    }
  }
  noLoop();
}

void mousePressed() {
  config();
}
