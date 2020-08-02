void setup() {
  size(800,800);
  background(255);
  strokeWeight(0.9);
  smooth();
}

void noiseSpiral() {
  
  float x,y;
  
  float centX = 400;
  float centY = 400;
  
  float lastx = -999;
  float lasty = -999;

  // Noise to radious
  float radiusNoise = random(10);
  float radius = 10;
  
  stroke(random(255), random(255), random(255),80);
  
  int startangle = int(random(360));
  int endangle = 1440 + int(random(1440));
  int anglestep = 5 + int(random(3));

  for(float ang=startangle; ang <= endangle; ang += anglestep) {
  // increment to noise
    radiusNoise += 0.05;
  
    radius += 0.5;
  
   // radius inside the for   
   float thisRadius = radius + (noise(radiusNoise) * 200) - 100; 
 
   float rad = radians(ang);
    x = centX + (thisRadius*cos(rad));
    y = centY + (thisRadius*sin(rad));
  
    if (lastx > -999) {
      line(x,y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}

void draw() {
  for(int i = 0; i <= 100; i++) {
    noiseSpiral();
  } 
  save("tentativa" + random(1000)+".png");
  noLoop();
}
