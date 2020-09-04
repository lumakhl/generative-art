void myShapezinho(float centX, float centY, float radius) {    
  float x, y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;

  beginShape();

  for (float ang = 0; ang <=360; ang+=1) {
    noiseval += 0.1;
    radVariance = 30 * customNoise1(noiseval);

    thisRadius = radius + radVariance;
    rad = radians(ang);

    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    noStroke();
    curveVertex(x, y);
  }
  endShape();
}

float customNoise1(float value) {
  float retValue = pow(sin(value), random(10));
  return retValue;
}
