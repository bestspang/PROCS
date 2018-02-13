class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  PVector moon;
  float sz, time, spd, mag, m, d1, d2;
  Ball() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0); //1,3
    acceleration = new PVector(0,0);
    sz = random(20,120);
    time = 0;
    spd = 0.005;
    mag = random(0.05, 0.15);
    
  }
  
  Ball(int g) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0); //1,3
    acceleration = new PVector(0,0);
    sz = random(20,120);
    time = 0;
    spd = 0.005;
    mag = random(0.05, 0.15);
    m = g;
    
  }
  
void init() {
  fill(20);;
  //sz = noise(time);
  //sz = map(sz, 0, 1,20,120);
  ellipse(location.x,location.y,sz,sz);
  time+= spd;
}

void move(Ball other) {
  //acceleration = PVector.random2D();
  mouse = new PVector(mouseX,mouseY);
  noFill();
  
  d1 = dist(mouse.x,mouse.y,other.location.x,other.location.y);
  ellipse(mouse.x,mouse.y,d1*2,d1*2);
  if (m == 1){
  mouse = new PVector(other.location.x,other.location.y);
  d2 = dist(location.x,location.y,other.location.x,other.location.y);
  }
  line(mouse.x,mouse.y,location.x,location.y);
  ellipse(other.location.x,other.location.y,d2*2,d2*2);
  
  mouse.sub(location);
  mouse.setMag(mag);
  acceleration = mouse;
  
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(5);
  
}

void move() {
  //acceleration = PVector.random2D();
  mouse = new PVector(mouseX,mouseY);
  line(mouse.x,mouse.y,location.x,location.y);
  mouse.sub(location);
  mouse.setMag(mag);
  acceleration = mouse;
  
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(5);
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