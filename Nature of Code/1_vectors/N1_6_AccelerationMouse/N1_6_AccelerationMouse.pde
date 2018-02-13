Ball[] b = new Ball[1];
Ball[] b2 = new Ball[1];

void setup() {
  size(800,800);
  background(0);
  for(int i = 0; i < b.length; i++){
  b[i] = new Ball();
  b2[i] = new Ball(1);
  }
  smooth(20);
  noCursor();
}

void draw() {
  background(255);
  for(int i = 0; i < b.length; i++){
  b[i].move();
  b[i].init();
  //b.detect();
  //b[i].edges();
  
  b2[i].move(b[i]);
  b2[i].init();
  //b2[i].edges();
  fill(42,44,43);
  }
  //noStroke();
  ellipse(mouseX, mouseY, 80,80);
}