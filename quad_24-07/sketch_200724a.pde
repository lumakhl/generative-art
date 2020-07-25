void setup() {
  size(800, 800);
}

int randomColor() {
  return (int) random(255);
}

void t() {
 int quantity = 2000;
 
 while(quantity >= 0) {
  float t = random(800);
  float y = random(800);
  float x = random(800);
  
  fill(randomColor(), randomColor());
  quad(t,x,y,x,t,y,y,t);
  
  quantity--;
 }  
}

void draw() {
  t();
  fill(0,0,0,95);
  circle(500, 500,500);
}
