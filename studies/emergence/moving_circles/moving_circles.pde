   /*
   * Leaving traces—Don’t clear the screen between frames.
   * Draw a transparent rectangle over everything instead (as described in 2.4.2).
   */
     
   /* Reducing the alpha and stroke weight—Make the lines more subtle to turn hard edges into an organic blur (see figure 6.7).*/
   
   /* Plotting more complex paths—You’ve already seen in previous chapters how there are far more interesting routes to take between two points than a straight line.
   * How about plotting movement along a curve, for example?*/
   
  /*Drawing more interesting shapes—Draw something more exciting than a simple circle. You can even import images to be the visual representations of objects.*/
   
    class Circle {
    float x,y;
    float radius;
    color linecol, fillcol;
    float alph;
    float xmove, ymove;
    
    Circle() {
      x = random(width);
      y = random(height);
      radius = random(100)+10;
      linecol = color(random(255), random(255), random(255));
      fillcol = color(random(255), random(255), random(255));
      alph = random(255);
      xmove = random(10)-5;
      ymove = random(10)-5;
    }
    
    void drawMe() {
      noStroke();
      fill(fillcol, alph);
      ellipse(x,y, radius*2, radius*2);
      stroke(linecol, 150);
      noFill();
      ellipse(x,y,10,10);
    }
    
    void updateMe() {
      x += xmove;
      y += ymove;
      if(x > (width+radius)) {x = 0-radius;}
      if(x < (0-radius)) { x = width+radius; }
      if(y > (height+radius)) {y = 0-radius;}
      if(y < (0-radius)) { y = height+radius; }
      
      //boolean touching = false;
      for(int i =0; i < _circleArr.length; i++){
        Circle otherCirc = _circleArr[i];
        if (otherCirc != this) {
          float dis = dist(x,y, otherCirc.x, otherCirc.y);
          float overlap = (dis - radius - otherCirc.radius);
          if (overlap < 0) {
            float midx, midy;
            midx = (x + otherCirc.x)/2;
            midy = (y + otherCirc.y)/2;
            stroke(0,100);
            noFill();
            overlap *= -1;
            ellipse(midx, midy, overlap, overlap);
            //touching =  true;
            //break;
          }          
        }
      }
      //if (touching){
      //  if(alph > 0){alph--;}
      //} else {
      //  if (alph < 255){alph +=2;}
      //}
     //drawMe();
    }
  }
  
  int _num = 10;
  Circle[] _circleArr = {};
  void setup() {
    size(500,300);
    background(255);
    smooth();
    strokeWeight(1);
    fill(150, 50);
    drawCircles();
  }

  void draw() {
    background(255);
    for(int i = 0; i< _circleArr.length; i++){
      Circle thisCirc = _circleArr[i];
      thisCirc.updateMe();
    }
  }

  void mouseReleased() {
    drawCircles();
    println(_circleArr.length);
  }
  
  void drawCircles() {
    for (int i=0; i<_num; i++) {
      Circle thisCirc = new Circle(); 
      thisCirc.drawMe();
      _circleArr = (Circle[])append(_circleArr, thisCirc);
    }
  }
