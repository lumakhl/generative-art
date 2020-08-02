void setup() {    
  size(900,900);
  background(255);
  strokeWeight(5);
  smooth();
  
  for(int i = 0; 100 >= i; i++) {
  
  float radius = random(899);
  int centX = int(random(800));
  int centY = int(random(800));
  
  stroke(0,30);
  noFill();
  //ellipse(centX, centY, radius*2, radius*2);
  
  stroke(20,50,70);
  strokeWeight(0.0003);
  float x,y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  
  beginShape();
  //fill(20,50,70,50);
  
  for(float ang = 0; ang <=10000; ang+=1) {
   noiseval += 0.1;
   radVariance = 30 * customNoise(noiseval);
   
   thisRadius = radius + radVariance;
   rad = radians(ang);
   
   x = centX + (thisRadius * cos(rad));
   y = centY + (thisRadius * sin(rad));
   
   curveVertex(x,y);
 }
 endShape();
  }
}

float customNoise(float value) {
  int count = int((value % 12)*2);
  float retValue = pow(cos(value), count);
  return retValue;
}
