NSrunner[] run = new NSrunner[5];
float tail = 100;
float tspd = 0.010;
float sz1 = 60;
float sz2 = 120;
float col = 250;
void setup() {
  size(600,600);
  colorMode(HSB);
  //frameRate(3);
  //run = new NSrunner();
  background(255);
  smooth(20);
  noStroke();
  for (int i = 0; i < run.length; i++) {
    run[i] = new NSrunner(tspd, sz1,sz2, col);
  }
}

void draw() {
  noStroke();
  fill(255,tail);
  rect(0,0,width,height);
  for (int i = 0; i < run.length; i++) {
  run[i].init();
  //run[i].runner();
  run[i].time();
  for (int j = 0; j < run.length; j++) {
    if (j != i) {
      //run[i].overlaps(run[j]);
      //run[i].lineCenter(run[j]);
      run[i].nearColor(run[j]);
      }
    }
  run[i].runner();
  }
}