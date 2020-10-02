void church(float centY, float len) {
  float xstep = 0.5;
  float lastx = -999;
  float lasty = -999;
  float angle = 0;

  len = 480;

  float largura = 20;

  float y = centY;
  strokeWeight(largura);
  stroke(0);

  float curve = 100;
  float newY = 0;

  pushMatrix();
  translate(-400, height-50);
  rotate(radians(-90));

  scale(1);

  for (float x=0; x <= len; x+= xstep) {
    float rad = radians(angle);
    newY = 50 + (cos(rad)*curve)+y;
    curve -= 0.1;
    if (lastx > -999) {
      strokeWeight(largura);
      line(0, newY, lastx, lasty);
      largura = largura <= 0.5 ? 1 : largura - 0.02;
    }
    lastx = x;
    lasty = newY;
    angle++;
  }
  popMatrix();
}
