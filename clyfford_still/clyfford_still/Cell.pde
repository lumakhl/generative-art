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

    spineCircle(x, y, random(345));  
    waveCircle(x, y, random(345));
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
