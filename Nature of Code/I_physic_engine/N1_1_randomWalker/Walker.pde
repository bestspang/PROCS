class Walker {
  int x,y;
  float rancol;
  
  Walker() {
    colorMode(HSB);
    x = width/2;
    y = width/2;
    rancol = random(0,255);
  }
  Walker(int xx, int yy) {
    colorMode(HSB);
    x = xx;
    y = yy;
    rancol = random(0,255);
  }
  
  void render() {
    stroke(0);
    stroke(rancol,255,255);
    point(x,y);
  }
  
  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else {
      y--;
    }
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,width-1);
  }
  
}