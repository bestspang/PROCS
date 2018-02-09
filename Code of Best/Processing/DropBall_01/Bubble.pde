class Bubble {
  float x, y, v, sz, a, vmem;
  color c;
  
  Bubble() {
    x = width/2;
    y = height/2;
    c = color(127);
    v = -1;
    vmem = v;
    sz = random(10,50);
    a = 0.05;
  }
  
  Bubble(float ballsz, float u) {
    x = width/2;
    y = height/2;
    c = color(127);
    v = u;
    vmem = v;
    sz = ballsz;
    a = 0.05;
  }
  
  Bubble(float ballsz, float xx, float yy) {
    x = xx;
    y = yy;
    c = color(127);
    v = -1;
    vmem = v;
    sz = ballsz;
    a = 0.05;
  }
  
  void display(){
  colorMode(HSB);
  noStroke();
  fill(255);
  //fill(c);
  ellipse(x,y,sz,sz);
  }
  
  void ascend(){
    y = y + v;
  }
  
  void pop(float x){
    c = color(x,245,245);
    fill(c);
  }
  
  void collided(float x){
    if (y >= height-sz/2 || int(y) <= 0+sz/2) {
      v *= -1;
      //rev();
      a *= -1;
      //println(a, v, y, height);
      pop(random(x));
    }
  }
  
  void acceleration(){
    v-=a;
  }
  
  boolean overlaps(Bubble other) {
    float d = dist(x,y,other.x,other.y);
    if (d < (sz+other.sz)/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void rev(){
    v *= -1;
    if (v < 0) {
      //v = vmem;
    }else {
      //v = vmem*-1;
    }
  }
  
  void powerup(Bubble other) {
    float x2 = other.x;
    float y2 = other.y;
    float d = dist(x,y,x2,y2);
    
    ellipse(d,d,10,10);
    
  }
  
  void lineCenter(Bubble other) {
    float cx = (x + other.x)/2;
    float cy = (y + other.y)/2;
    float dx = x - other.x;
    float dy = y - other.y;
    line(x,y,cx,cy);
    for (int i = 0; i < 100; i++) {
    //line(x,y,mx,my);
    }
  }
  
  
}