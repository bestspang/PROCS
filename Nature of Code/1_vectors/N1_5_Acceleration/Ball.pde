class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float sz, time, spd;
  Ball() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0); //1,3
    acceleration = new PVector(0,0);
    sz = 40;
    time = 0;
    spd = 0.005;
  }
  
void init() {
  fill(255);
  sz = noise(time);
  sz = map(sz, 0, 1,20,160);
  ellipse(location.x,location.y,sz,sz);
  time+= spd;
}

void move() {
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(4);
  acceleration = PVector.random2D();
  
}

void edges() {
  if (location.x > width+sz/2) location.x = 0;
  if (location.x < 0-sz/2)     location.x = width;
  if (location.y > height+sz/2)location.y = 0; 
  if (location.y < 0-sz/2)     location.y = height;
}

void detect() {
  if (location.x>width-sz/2 || location.x<0+sz/2) {
    velocity.x*=-1;
  } if (location.y>height-sz/2 || location.y<0+sz/2){
    velocity.y*=-1;
  }
  }
}