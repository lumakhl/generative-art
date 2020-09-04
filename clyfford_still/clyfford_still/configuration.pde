Cell[][] _cellArray;
int _cellSize = 125; //125 the best value
int _numX, _numY;
color c1, c2, c3;

void config() {
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
