void drawMe(CENTRAL_PATTERNS pattern, int centX, int centY) {
  switch(pattern) {
  case SHADOW_CIRCLE:
    shadowCircle(centX, centY);
    break;
  case CIRCLE:
    circle(centX, centY);
    break;
  case STRIPED_CIRCLE:
    stripedCircle(centX, centY);
    break;
  case ARCS:
    arcs( centX, centY, 3, 60, 60, 9, 10, 45);
    break;
  case TRAPEZE: 
    trapeze(centX, centY);
    break;
  case COLOR_TRAPAZE: 
    colorTrapeze(centX, centY);
    break;
  case DARK_TRIANGLE:
    darkTriangle(centX, centY);
    break;
  case TRIANGLE:
    triangle(centX, centY);
    break;
  case DOUBLE_TRIANGLE:
    doubleTriangle(centX, centY);
    break;
  case COLOR_TRIANGLE:
    colorTriangle(centX, centY);
    break;
  case SQUARE:
    square(centX, centY);
    break;
  }
}

void drawMe(EDGE_PATTERNS pattern, int centX, int centY) {
  switch(pattern) {
  case GROUPED_LINE:
    groupedLine( centX, centY); 
    break;
  case GROUPED_TRIANGLE_LINE:
    groupedTriangleLine( centX, centY); 
    break;
  case CURVED_LINE:
    curvedLine( centX, centY); 
    break;
  case CUTED_LINE:
    cutedLine( centX, centY); 
    break;
  case SIMPLE_LINE:
    simpleLine( centX, centY); 
    break;
  case EYEBROW:
    eyebrow( centX, centY); 
    break;
  case SEMI_CIRCLE:
    semiCircle( centX, centY); 
    break;
  case FLAG:
    flag( centX, centY); 
    break;
  case DARK_SQUARE:
    darkSquare( centX, centY); 
    break;
  }
}
