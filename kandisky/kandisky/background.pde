float inc = 0.005;

void drawContour() {
  float yoff = 0;

  loadPixels();

  for (int x = 0; x < width; x++) { 
    float xoff = 0;
    for (int y = 0; y < height; y++) {
      int index = (x + y * width);
      float n = noise(xoff, yoff);
      float r = map(n, 0, 1, red, red-50);
      float g = map(n, 0, 1, green, green-50);
      float b = map(n, 0, 1, blue, blue-50);
      pixels[index] = color(r, g, b);
      xoff += inc;
    }
    yoff += inc;
  }
  updatePixels();
}

void drawContourRandom(int cx, int cy, int cr) {

  float yoff = 0;
  loadPixels();

  float h = random(255);
  float i = random(255);
  float j = random(255);
  for (int x = 0; x < width; x++) { 
    float xoff = 0;
    for (int y = 0; y < height; y++) {
      int index = (x + y * width);
      float n = noise(xoff, yoff);
      float r = map(n, 0, 1, h, h-50);
      float g = map(n, 0, 1, i, i-50);
      float b = map(n, 0, 1, j, j-50);
      if (!(dist(cx, cy, x, y)>cr)) {
        pixels[index] = color(r, g, b);
      }
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  updatePixels();
}
