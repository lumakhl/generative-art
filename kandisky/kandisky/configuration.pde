float red, green, blue;

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
