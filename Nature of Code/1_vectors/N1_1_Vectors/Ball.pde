class Ball {
  float x,y,xs,ys;
  
  Ball() {
    x = width/2;
    y = height/2;
    xs = 2.5;
    ys = -2;
  }
  
  void move() {
    x = x + xs;
    y = y + ys;
  }
  
  void bounce() {
     if (x>width-sz/2 || x<0+sz/2) {
       xs*=-1;

     }if (y>height-sz/2 || y<0){
       ys*=-1;
     }
  }
  
  void display() {
    ellipse(x,y,sz,sz);
  }
  
}