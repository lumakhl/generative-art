
int counter = 0;


void setup() {
  size(800,800);
  background(randomColor(), randomColor(), randomColor());
 
}

int randomColor() {
  int i = (int) random(255);
  return i;
}

void t() {
  
  while(counter <= 5) {
    float x = random(1000);
    float y = random(1000);
    float z = random(1000);
 
    fill(randomColor(), randomColor(), randomColor(), randomColor());
    circle(x, y, z);
    
    counter++;
  }
}

void draw() {
  t();
  noLoop();
}
  
