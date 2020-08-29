
float[][] field;
int res = 20;
int cols, rows;
float increment = 0.1;
float zoff = 0;
OpenSimplexNoise noise;

void setup() {
  size(800,800);
  
  noise = new OpenSimplexNoise();
  cols = 1 + width / res;
  rows = 1 + height / res;
  field = new float[cols][rows];

}

void draw() {
  background(0);
  float xoff = 0;  
  for (int i = 0; i < cols; i++){
    xoff += increment;
    float yoff = 0;
    for (int j = 0; j < rows; j++) {
      field[i][j] = (float) noise.eval(xoff, yoff, zoff);
      yoff += increment;
    }
  }
  
  zoff += 0.03;
  
  //desenhaContorno();
  
 // for (int i = 0; i < cols; i++){
    //for (int j = 0; j < rows; j++) {
    //  fill(field[i][j] * 255, field[i][j] * 123, field[i][j] * 35);
    //  noStroke();
   //   rect(i*res, j*res, res, res);
      //arc(i*res, j*res, res, res, i, j);
      //triangle(i*res, j*res, res, res, res, res);
   // }
 // } //<>// //<>//
  noLoop();
}

void desenhaContorno() {

  for (int i = 0; i < cols-1; i++){
    for (int j = 0; j < rows-1; j++) {
      float x = i * res;
      float y = j * res;
      PVector a = new PVector(x + res*0.5, y);
      PVector b = new PVector(x + res, y + res*0.5);
      PVector c = new PVector(x + res*0.5, y + res);
      PVector d = new PVector(x, y + res*0.5);
      int state = getState(ceil(field[i][j]),  ceil(field[i+1][j]), ceil(field[i+1][j+1]), ceil(field[i][j+1]));       
      stroke(255, 130, 56);
      strokeWeight(70);
      switch (state) {
      case 1:  
        line(c, d);
        break;
      case 2:  
        line(b, c);
        break;
      case 3:  
        line(b, d);
        break;
      case 4:  
        line(a, b);
        break;
      case 5:  
        line(a, d);
        line(b, c);
        break;
      case 6:  
        line(a, c);
        break;
      case 7:  
        line(a, d);
        break;
      case 8:  
        line(a, d);
        break;
      case 9:  
        line(a, c);
        break;
      case 10: 
        line(a, b);
        line(c, d);
        break;
      case 11: 
        line(a, b);
        break;
      case 12: 
        line(b, d);
        break;
      case 13: 
        line(b, c);
        break;
      case 14: 
        line(c, d);
        break;
      }
    }
  }
}


void line(PVector v1, PVector v2){
  line(v1.x, v1.y, v2.x, v2.y);
}

int getState(int a , int b, int c, int d) {
  return a * 8 + b * 4 + c * 2 + d * 1;
}
