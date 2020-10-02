boolean isCircle(int x, int y) {
  for (Star star : estrelas) {
    if (!(dist(star.x, star.y, x, y)>star.radius)) {
      return true;
    }
  };
  return false;
}

void checkSky(int y) {
  if (y > (600)) {
    strokeWeight(2);
    stroke(0, random(255));
  } else {
    strokeWeight(1);
    stroke(0, 0, random(100, 255));
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  line(0, 0, 20, 0);
  popMatrix();
}
