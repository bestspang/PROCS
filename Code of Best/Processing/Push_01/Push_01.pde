float x,ax,bx;
void setup() {
  size(800,400);
  noStroke();
  colorMode(HSB);
  ax = width/2;
}

void draw() {
  x = width;
  ax = mouseX;
  bx = x-ax;
  fill(100,255,255);
  rect(0,0,ax,height);
  fill(200,255,255);
  rect(ax,0,bx,height);
}

void mouseClicked() {
  if (mouseX < ax) {
    for(int i = 0; i <50; i++) {
      ax++;
      i++;
    }
  }
}