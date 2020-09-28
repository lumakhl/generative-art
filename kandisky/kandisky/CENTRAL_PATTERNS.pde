enum CENTRAL_PATTERNS {
    SHADOW_CIRCLE(0), 
    CIRCLE(1), 
    STRIPED_CIRCLE(2), 
    ARCS(3), 
    TRAPEZE(4), 
    COLOR_TRAPAZE(5), 
    DARK_TRIANGLE(6), 
    TRIANGLE(7), 
    DOUBLE_TRIANGLE(8), 
    COLOR_TRIANGLE(9), 
    SQUARE(10);

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
      return SHADOW_CIRCLE;
    case 1: 
      return CIRCLE;
    case 2: 
      return STRIPED_CIRCLE;
    case 3: 
      return ARCS;
    case 4: 
      return TRAPEZE;
    case 5: 
      return COLOR_TRAPAZE;
    case 6: 
      return DARK_TRIANGLE;
    case 7: 
      return TRIANGLE;
    case 8: 
      return DOUBLE_TRIANGLE;
    case 9: 
      return COLOR_TRIANGLE;
    case 10: 
      return SQUARE;
    default:
      return null;
    }
  }
}
