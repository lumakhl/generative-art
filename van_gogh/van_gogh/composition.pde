void createComposition() {
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);

  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;

    checkSky(y);

    for (int x =0; x <= width; x+=5) {
      xnoise += 0.1;

      if (isCircle(x, y)) {
        stroke(200, 150, 0);
      } else {
        checkSky(y);
      }

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  church(height/2+200, 1000);
}
