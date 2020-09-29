float red, green, blue;

ArrayList<CENTRAL_PATTERNS> central_patterns;
ArrayList<EDGE_PATTERNS> edge_right;
ArrayList<EDGE_PATTERNS> edge_left;
ArrayList<EDGE_PATTERNS> edge_bottom;
ArrayList<EDGE_PATTERNS> edge_up;

int randomSignum() {
  return (int) random(2) * 2 - 1;
}

color cream() {
  red = 255;
  green = 253;
  blue = 240;
  return color(red, green, blue);
}

color darkBlue() {
  red = 112;
  green = 146;
  blue = 166;
  return color(red, green, blue);
}

void configBaseColor() {
  isDark = randomSignum() == -1 ? true : false;
  baseColor = isDark ? darkBlue() : cream();
}

void initialize() {
  int qty_central = int(random(3, 9));
  int qty_right = int(random(3, 9));
  int qty_left = int(random(3, 9));
  int qty_bottom = int(random(3, 9));
  int qty_up = int(random(3, 9));

  central_patterns = new ArrayList();
  edge_right = new ArrayList();
  edge_left = new ArrayList();
  edge_bottom = new ArrayList();
  edge_up = new ArrayList();

  initializeCenter(qty_central);
  initializeRight(qty_right);
  initializeLeft(qty_left);
  initializeBottom(qty_bottom);
  initializeUp(qty_up);
}

void initializeCenter(int quantity) {
  for (int i = 0; i < quantity; i++) {
    CENTRAL_PATTERNS pattern = CENTRAL_PATTERNS.intToCentralPattern(int(random(0, 13)));
    central_patterns.add(pattern);
  }
}

void initializeRight(int quantity) {
  for (int i = 0; i < quantity; i++) {
    EDGE_PATTERNS pattern = EDGE_PATTERNS.intToEdgePattern(int(random(0, 9)));
    edge_right.add(pattern);
  }
}

void initializeLeft(int quantity) {
  for (int i = 0; i < quantity; i++) {
    EDGE_PATTERNS pattern = EDGE_PATTERNS.intToEdgePattern(int(random(0, 9)));
    edge_left.add(pattern);
  }
}
void initializeBottom(int quantity) {
  for (int i = 0; i < quantity; i++) {
    EDGE_PATTERNS pattern = EDGE_PATTERNS.intToEdgePattern(int(random(0, 9)));
    edge_bottom.add(pattern);
  }
}
void initializeUp(int quantity) {
  for (int i = 0; i < quantity; i++) {
    EDGE_PATTERNS pattern = EDGE_PATTERNS.intToEdgePattern(int(random(0, 8)));
    edge_up.add(pattern);
  }
}
