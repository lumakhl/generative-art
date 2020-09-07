public enum COLOR {
  RED(0),
  BLUE(1),
  YELLOW(2),
  ORANGE(3),
  PINK(4),
  BLACK(5),
  WHITE(6),
  SILVER(7);
  
  private final int value;
  
  private COLOR(int value) {
    this.value = value;
  }
  
  public int getValue() {
    return value;
  }
  
  public static COLOR intToColor(int option) {
    switch(option) {
      case 0:
        return RED;
      case 1:
        return BLUE;
      case 2:
        return YELLOW;
      case 3:
        return ORANGE;
      case 4:
        return PINK;
      case 5:
        return BLACK;
      case 6:
        return WHITE;
      case 7:
        return SILVER;
      default:
        return BLACK;
    }
  }
}
