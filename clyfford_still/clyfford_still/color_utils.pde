void myColors() {
  int myColor = int(random(8));
  switch(myColor) {
  }
}

COLOR getRandomColor() {
  int option = int(random(8));

  return COLOR.intToColor(option);
}

color myColorIncrement(COLOR baseColor, float incrementFactor) {

  switch(baseColor) {
  case RED:
    return color(incrementFactor, 0, 0);
  case BLUE:
    return color(0, 0, incrementFactor);
  case YELLOW:
    return color(incrementFactor, random(255)*noise(incrementFactor),0);
  case ORANGE:
    return color(255, incrementFactor, random(255));
  case PINK:
    return color(255, incrementFactor, 203);
  case BLACK:
    return color(0);
  case WHITE:
    return color(255);
  case SILVER:
    return color(169+incrementFactor, 169+incrementFactor, 169+incrementFactor);
  default:
    return color(0);
  }
}
