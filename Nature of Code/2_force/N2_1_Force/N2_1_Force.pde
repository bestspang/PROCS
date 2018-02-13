Ball[] b = new Ball[1];

void setup() {
  size(640,360);
  background(0);
  for(int i = 0; i < b.length; i++){
  b[i] = new Ball();
  }
  smooth(20);
}

void draw() {
  background(255);
  PVector gravity = new PVector(0,0.3);
  PVector wind = new PVector(0.1,0);
  
  for(int i = 0; i < b.length; i++){
  if (mousePressed) {
  b[i].applyForce(wind);
  }
  b[i].applyForce(gravity);
  
  b[i].update();
  b[i].display();
  b[i].detect();
  //b[i].edges();
  }

}