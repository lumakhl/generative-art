float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;  float _strokeCol = 254;
int _strokeChange = -1;


void setup() {
  size(800, 800);
  smooth();
  frameRate(30);
  background(255);

  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);

}

void wave() {
  
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 500) +1;

  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }

  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerX = width/2 + (noise(_xnoise) * 100) - 50;
  float centerY = height/2 + (noise(_ynoise) * 100) - 50;

  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad));
  float y1 = centerY + (_radius * sin(rad));

  float opprad = rad + PI;
  float x2 = centerX + (_radius * cos(opprad));
  float y2 = centerY + (_radius * sin(opprad));

  _strokeCol += _strokeChange;
  if (_strokeCol > 254) { _strokeChange = -1; }
  if (_strokeCol < 0) { _strokeChange = 1; }
  stroke(167, 45,45,45);
  strokeWeight(4);
  line(x1, y1, x2, y2);
}

  void draw() {
    
    for(int i = 0; i < 2000; i++) {
      wave();
    }
    save("wave"+ random(1000)+ ".png");
    
    noLoop();


}
