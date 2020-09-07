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

  void drawMe(float n) {
    state = nextState;
    stroke(0);

    if (state == 1) {
      fill(myColorIncrement(c1,n));
    } else if (state == 2) {
      fill(myColorIncrement(c2,n));
    } else {
      int r = int(random(3));
      
      if(r == 1) {
        c3 = COLOR.WHITE;
      } else if (r == 2) {
        c3 = COLOR.BLACK;
      } else {
        c3 = COLOR.SILVER;
      }
      fill(myColorIncrement(c3,n));
    }
    
    waveCircle(x, y, random(345));
    spineCircle(x, y, random(345));  
  }

  color myColorChoice(float n) {
    float value = random(1000);

    if (value > 333) { 
      return color(n, 0, 0);
    } else if (value > 666) {
      return color(255);
    } else { 
      return color(0);
    }
  }
}
