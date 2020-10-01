enum CENTRAL_PATTERNS {
  CIRCLE(0), 
    SQUARE(1), 
    TRIANGLE(2), 
    TRAPEZE(3), 
    SHADOW_CIRCLE(4), 
    STRIPED_CIRCLE(5), 
    ARCS(6), 
    COLOR_TRAPAZE(7), 
    DARK_TRIANGLE(8), 
    DOUBLE_TRIANGLE(9), 
    COLOR_TRIANGLE(10), 
    CLOSE_GRADE(11), 
    OPENED_GRID(12);


  private final int value;

  private CENTRAL_PATTERNS(int value) {
    this.value = value;
  }

  public int getValue() {
    return this.value;
  }

  public static CENTRAL_PATTERNS intToCentralPattern(int option) {
    switch(option) {
    case 0:
      return CIRCLE;
    case 1: 
      return SQUARE;
    case 2: 
      return TRIANGLE;
    case 3: 
      return TRAPEZE;
    case 4: 
      return SHADOW_CIRCLE;
    case 5: 
      return STRIPED_CIRCLE;
    case 6: 
      return ARCS;
    case 7: 
      return COLOR_TRAPAZE;
    case 8: 
      return DARK_TRIANGLE;
    case 9: 
      return DOUBLE_TRIANGLE;
    case 10: 
      return COLOR_TRIANGLE;
    case 11:
      return CLOSE_GRADE;
    case 12:
      return OPENED_GRID;
    default:
      return null;
    }
  }
}
