class NSrunner {
  float t,t2,col,tail,sz,ts,x,y, rgb;
  int count;
  color c;
  NSrunner(){
    t = random(0,10000);
    t2 = random(0,10000);
    col = random(20,150);
    tail = 50;
    sz = random(20, 50);
    ts = 0.01;
  }
  NSrunner(float taili, float rm){
    tail = taili;
    t = random(0,10000);
    t2 = random(0,10000);
    col = random(30,150);
    sz = random(20, 50);
    ts = random(0.005,rm);
  }
  
  NSrunner(float rm,float sz1,float sz2,float rg){
    t = random(0,10000);
    t2 = random(0,10000);
    col = random(30,150);
    sz = random(sz1, sz2);
    ts = random(0.005,rm);
    rgb = rg;
  }
  
  void init() {
    //fill(255,tail);
    //rect(0,0,width,height);
    c = color(rgb,0,col);
    fill(c);
  }
  
  void runner() {
    x = noise(t);
    x = map(x,0,1,0,width);
    y = noise(t2);
    y = map(y,0,1,0,height);
    ellipse(x,y,sz,sz);
  }
  
  void time() {
    t = t+ts;
    t2 = t2+ts;
  }
  
  boolean overlaps(NSrunner other) {
    float d = dist(x,y,other.x,other.y);
    //println(d);
    if (d < (sz+other.sz)/2) {
      //count = count + 1;
      println("overlap!");
      return true;
    } else {
      return false;
    }
  }
  
  void nearColor(NSrunner other) {
    float d = dist(x,y,other.x,other.y);
    if (d < 200) {
      float b = map(d, 200, 0, col, 255);
      //println(b);
      float h = map(d, 200, 0, 0 ,255);
      fill(rgb,h,b);
    } 
  }
  
  void lineCenter(NSrunner other) {
    stroke(20);
    strokeWeight(0.1);
    line(x,y,other.x,other.y);
  }
  
}