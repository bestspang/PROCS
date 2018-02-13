class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  float sz, time, spd, mag, mass;
  Ball() {
    location = new PVector(random(0+sz*2,width-sz*2), height/2);
    velocity = new PVector(0,0); //1,3
    acceleration = new PVector(0,0);
    mass = random(0.5,3);
    sz = random(30,30);
    time = 0;
    spd = 0.005;
    mag = random(0.05, 0.15);
    
  }

  
void display() {
  fill(20);;
  //sz = noise(time);
  //sz = map(sz, 0, 1,20,120);
  ellipse(location.x,location.y,sz*mass,sz*mass);
  time+= spd;
}

void applyForce(PVector force){
  PVector f = PVector.div(force,mass);//add mass
  acceleration.add(f);
}

void update() {
  //acceleration = PVector.random2D();
  //mouse = new PVector(mouseX,mouseY);
  //line(mouse.x,mouse.y,location.x,location.y);
  //mouse.sub(location);
  //mouse.setMag(mag);
  //acceleration = mouse;
  
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);// set accel to 0 for each frame
  //velocity.limit(5);
}

void edges() {
 float si = sz/2;
  if (location.x > width+si) location.x = 0;
  if (location.x < 0-si)     location.x = width;
  if (location.y > height+si)location.y = 0; 
  if (location.y < 0-si)     location.y = height;
}

void detect() {
  if (location.x>width-sz/2) {
    location.x = width-sz/2;
    velocity.x*=-1;
  } else if (location.x<0+sz/2) {
    location.x = 0+sz/2;
    velocity.x*=-1;
  } if (location.y>height-sz/2) {
    location.y = height-sz/2;
    velocity.y*=-1;
  }  else if (location.y<0+sz/2) {
    location.y = 0+sz/2;
    velocity.y*=-1;
  }
  }
}