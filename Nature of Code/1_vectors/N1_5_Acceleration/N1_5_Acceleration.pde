Ball[] b = new Ball[5];

void setup() {
  size(800,800);
  background(0);
  for(int i = 0; i < b.length; i++){
  b[i] = new Ball();
  }
  smooth(20);
}

void draw() {
  //background(0);
  for(int i = 0; i < b.length; i++){
  b[i].init();
  b[i].move();
  //b.detect();
  b[i].edges();
  }
}