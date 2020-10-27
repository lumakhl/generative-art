float xstart, xnoise, ynoise;
void setup() {
  size(800, 800);
  smooth();
  background(255);
  
  initialize();
}

void draw() {

  for (int x = 0; x < 3; x++) {
    createComposition();
  }
 // noLoop();
  save("van-gogh"+random(1000)+"png");
}
