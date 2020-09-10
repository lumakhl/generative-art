int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void prepare() {
  //size(200, 200, P3D);  // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
}

void saveWithFilter(PImage img) {
  prepare();
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])+115;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
}

int radius = 3;
int intensity_level = 20;
int num_pixels = 20;

color readColor(color[] pixels, int x, int y) {
  return pixels[(width-1-x) + y*width];
  //return pixels[x + y*width];
}

void oilPaintingFilter(PImage img) {
   // video.loadPixels();
  img.loadPixels();
  for (int rand_y = 0; rand_y < height; rand_y++) {
    for (int rand_x = 0; rand_x < width; rand_x++) {
      int[] intensityCount = new int[intensity_level + 1];
      float[] averageR = new float[intensity_level + 1];
      float[] averageG = new float[intensity_level + 1];
      float[] averageB = new float[intensity_level + 1];

      int lo_x = (rand_x - radius) >=0 ? (rand_x - radius) : 0;
      int hi_x = (rand_x + radius) < width ? (rand_x + radius) : width - 1;
      int lo_y = (rand_y - radius) >=0 ? (rand_y - radius) : 0;
      int hi_y = (rand_y + radius) < height ? (rand_y + radius) : height - 1;

      //println(lo_x + " " + hi_x + " " + lo_y + " " + hi_y + " ");

      for (int x  = lo_x; x <= hi_x; x++) {
        for (int y = lo_y; y <= hi_y; y++) {
          //color c = get(x, y);
          color c = readColor(img.pixels, x, y);
          float r = red(c);
          float g = green(c);
          float b = blue(c);

          //println("r:" + r + " g:" + g + " b:" + b);
          //float test = 255;
          
          //int curIntensity = (int)(((double)((r+g+b)/3) * intensity_level)/test);
          int curIntensity = int((((r+g+b)/3.0)*intensity_level)/255.0);
          //println(curIntensity);
          intensityCount[curIntensity]++;
          averageR[curIntensity] += r;
          averageG[curIntensity] += g;
          averageB[curIntensity] += b;
        }
      }

      int maxIndex = 0;
      int max = 0;
      for (int i = 0; i <= intensity_level; i++) {
        if (intensityCount[i] > max) {
          max = intensityCount[i];
          maxIndex = i;
        }
      }

      int R = int(averageR[maxIndex] / max);
      int G = int(averageG[maxIndex] / max);
      int B = int(averageB[maxIndex] / max);

      color finalColor = color(R, G, B);

      set(rand_x, rand_y, finalColor);
    }
  }
  filter(BLUR);
}
