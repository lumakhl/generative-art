void lines(float value) {
  //stroke(20,50,70);
  stroke(randomColor(),randomColor(),randomColor());
  strokeWeight(noise(10));
  int step = 25;
  float lastx = -999;
  float lasty = -999;

  float ynoise = random(value);
  float y;

  for(int x=20; x<=780; x+= step) {
    y = 10 + noise(ynoise)*value;
   
    if(lastx > -999) {
      line(x,y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise +=0.03;
  }
}

void showLines() {
  for(int x = 0; x <= 25; x++) {
    fill(204, 102, 0);
    lines(700);
  }
  
  for(int x = 0; x <= 5; x++) {
    fill(204, 102, 0);
    lines(200);
  }
  
  for(int x = 0; x <= 45; x++) {
    lines(500);
  }
    for(int x = 0; x <= 38; x++) {
    lines(900);
  }
}

int randomColor() {
  return (int) random(255);
}

void setup() {
  size(800, 800);
  background(25);
}

void draw() {
  for (int u = 0; u <= 45; u++) { 
    showLines();
    save("luma" + u + ".png");
  }
  noLoop();
}
