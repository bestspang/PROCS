Ball[] b = new Ball[5];

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
  
  for(Ball b : b){ // enhanced loop
  
  PVector gravity = new PVector(0,0.3);
  gravity.mult(b.mass);//true gravity
  PVector wind = new PVector(0.1,0);
  
  if (mousePressed) {
  b.applyForce(wind);
  }
  b.applyForce(gravity);
  
  b.update();
  b.display();
  b.detect();
  //b[i].edges();
  }

}