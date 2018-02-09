float yoff = 0.0; 
float increment = 0.02;

/******************************************************/

void setup() {
  size(600,600);
}

void draw() {
  background(50);
  //pNoise();
  wNoise();
  //nNoise();
}

/******************************************************/

void pNoise() {
  loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        float bright = map(noise(x,y),0,1,0,255);
        //float bright = random(255);
        pixels[x+y*width] = color(bright);
      }
    }
updatePixels();
}

void wNoise() {
  fill(255);
  beginShape(); 
  
  float xoff = 0;

  for (float x = 0; x <= width; x += 10) {

    float y = map(noise(xoff, yoff), 0, 1, (height*0.8)-100,height*0.8);
    // float y = map(noise(xoff), 0, 1, 200,300);
    vertex(x, y); 

    xoff += 0.05;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void nNoise() {
  loadPixels();

  float xoff = 0.0;
  float detail = map(mouseX, 0, width, 0.1, 0.6);
  noiseDetail(8, detail);

  for (int x = 0; x < width; x++) {
    xoff += increment;
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      yoff += increment;
      float bright = noise(xoff, yoff) * 255;

      pixels[x+y*width] = color(bright);
    }
  }
  
  updatePixels();
}