enum EDGE_PATTERNS {
    GROUPED_LINE(0), 
    GROUPED_TRIANGLE_LINE(1), 
    CURVED_LINE(2), 
    CUTED_LINE(3), 
    SIMPLE_LINE(4), 
    EYEBROW(5), 
    SEMI_CIRCLE(6), 
    FLAG(7), 
    DARK_SQUARE(8);

  private final int value;

  private EDGE_PATTERNS(int value) {
    this.value = value;
  }

  public int getValue() {
    return this.value;
  }

  public static EDGE_PATTERNS intToEdgePattern(int option) {
    switch(option) {
    case 0:
      return GROUPED_LINE;
    case 1:
      return GROUPED_TRIANGLE_LINE;
    case 2:
      return CURVED_LINE;
    case 3:
      return CUTED_LINE;
    case 4:
      return SIMPLE_LINE;
    case 5:
      return EYEBROW;
    case 6:
      return SEMI_CIRCLE;
    case 7: 
      return FLAG;
    case 8:
      return DARK_SQUARE;
    default: 
      return null;
    }
  }
}
