  Cell[][] _cellArray;
  int _cellSize = 75;
  int _numX, _numY;
  color c1, c2, c3;

  void setup() {
    size(800,800);
    _numX = floor(width/_cellSize);
    _numY = floor(height/_cellSize);
    smooth(300);
    
    c1 = color(random(255), random(255), random(255));
    restart();
  }
  
  void restart() {
    _cellArray = new Cell[_numX][_numY];
    for(int x = 0; x < _numX; x++) {
      for(int y = 0; y < _numY; y++) {
        Cell newCell = new Cell(x,y);
        _cellArray[x][y] = newCell;
      }
    }
    
    for(int x = 0; x < _numX; x++) {
      for(int y = 0; y < _numY; y++) {
        
        int above = y-1;
        int below = y+1;
        int left = x-1;
        int right = x+1;
        
        if(above < 0){ above = _numY-1; }
        if(below == _numY){ below = 0; }
        if(left < 0){ left = _numX-1; }
        if(right == _numX){ right = 0; }
        
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
    
    for(int x = 0; x < _numX; x++) {
      for(int y = 0; y < _numY; y++) {
        _cellArray[x][y].calcNextState();
      }
    }
    
    translate(_cellSize/2, _cellSize/2);
    
    for(int x = 0; x < _numX; x++) {
      for(int y = 0; y < _numY; y++) {
        _cellArray[x][y].drawMe();
      } 
    }
    noLoop();
  }
  
  void mousePressed() {
    restart();
  }
  
  // ============================= object
  
  class Cell {
    float x,y;
    boolean state;
    boolean nextState;
    Cell[] neighbours;
    
    Cell(float ex, float why) {
      x = ex * _cellSize;
      y = why * _cellSize;
      
      if(random(2) > 1) {
        nextState = true;
      } else {
        nextState = false;
      }
      state = nextState;
      neighbours = new Cell[0];
    }
    
    void addNeighbour(Cell cell) {
      neighbours = (Cell[])append(neighbours, cell);
    }
    
    void calcNextState() {
      int liveCount = 0;
      if (state) { liveCount++; }
      
      for(int i = 0; i < neighbours.length; i++) {
        if (neighbours[i].state) {
          liveCount++;
        }
      }
      
      if (liveCount <= 4) {
        nextState = false;
      } else if (liveCount > 4) {
        nextState = true;
      }
      
      if ((liveCount == 4) || (liveCount == 5)) {
        nextState = !nextState;
      }
    }
    
    void drawMe() {
      state = nextState;
      noStroke();
      
      if(state == true) {
        fill(0);
      } else {
        fill(red(c1),0,0);
      }
      myShape(x,y, _cellSize);
    }
    
    color myColorChoice() {
      return 1;
    }
  }
