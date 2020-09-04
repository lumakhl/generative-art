Cell[][] _cellArray;
int _cellSize = 125; //125 the best value
int _numX, _numY;
color c1, c2, c3;

void setup() {
  size(800, 800);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  smooth(300);

  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  restart();
}

void restart() {
  _cellArray = new Cell[_numX][_numY];
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }

  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {

      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;

      if (above < 0) { 
        above = _numY-1;
      }
      if (below == _numY) { 
        below = 0;
      }
      if (left < 0) { 
        left = _numX-1;
      }
      if (right == _numX) { 
        right = 0;
      }

      _cellArray[x][y].addNeighbour(_cellArray[left][above]);
      _cellArray[x][y].addNeighbour(_cellArray[left][y]);
      _cellArray[x][y].addNeighbour(_cellArray[left][below]);
      _cellArray[x][y].addNeighbour(_cellArray[x][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][y]);
      _cellArray[x][y].addNeighbour(_cellArray[right][above]);
      _cellArray[x][y].addNeighbour(_cellArray[x][above]);
    }
  }
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
  //filter(BLUR, 3);
  filter(ERODE);
  noLoop();
}

void mousePressed() {
  restart();
}

// ============================= object

class Cell {
  float x, y;
  int state;
  int nextState;
  Cell[] neighbours;

  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;

    nextState = int(random(2));
    state = nextState;
    neighbours = new Cell[0];
  }

  void addNeighbour(Cell cell) {
    neighbours = (Cell[])append(neighbours, cell);
  }

  void calcNextState() {
    if (state == 0) {
      int firingCount = 0;
      for (int i =0; i <neighbours.length; i++) {
        if (neighbours[i].state == 1) {
          firingCount++;
        }
      }
      if (firingCount == 2) {
        nextState = 1;
      } else {
        nextState = state;
      }
    } else if (state == 1) {
      nextState = 2;
    } else if (state == 2) {
      nextState = 0;
    }
  }

  void drawMe() {
    state = nextState;
    stroke(0);

    if (state == 1) {
      fill(0);
    } else if (state == 2) {
      fill(255, 45, 80);
    } else {
      fill(255);
    }

    myShape(x, y, random(345));  
    myShapezinho(x, y, random(345));
  }

  float myColorChoice() {
    float value = random(1000);

    if (value > 500) { 
      return c1;
    } else if (value > 850) {
      return c2;
    } else { 
      return c3;
    }
  }
}
