Ball[] b = new Ball[20];

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
  
  PVector gravity = new PVector(0,0.9);
  //gravity.mult(b.mass);//true gravity
  float m = noise(frameCount*0.01);
  println(m);
  m = map(m, 0,1,-2,2);
  PVector wind = new PVector(m,0);
  
  // friction!
  PVector friction = b.velocity.copy();//.copy() & .get()
  friction.normalize();
  float c = -0.1;
  friction.mult(c);
  b.applyForce(friction);
  
  
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