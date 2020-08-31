 void myShape(float centX, float centY, float radius) {    
  float x,y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  
  beginShape();
 // fill(20,50,70,50);
  
  for(float ang = 0; ang <=360; ang+=1) {
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

float customNoise(float value) {
  int count = int((value % 5));
  float retValue = pow(sin(value), count);
  return retValue;
}
