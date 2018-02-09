Walker[] w = new Walker[5];
void setup() {
  size(800,600);
  //create object
  background(255);
  for (int i = 0; i < w.length; i++) {
  w[i] = new Walker(int(random(0+width/5,width-width/5)),
  int(random(0+height/5,height-height/5)));
  }
}

void draw() {
  //run the object
  for (int i = 0; i < w.length; i++) {
  w[i].render();
  w[i].step();
  }
}