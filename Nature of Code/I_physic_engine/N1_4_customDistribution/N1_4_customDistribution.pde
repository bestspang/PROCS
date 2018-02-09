import java.util.Random;
Random gen;
void setup() {
  size(800,400);
  background(255);
  gen = new Random();
}

void draw() {
  background(255);
  float h = (float) gen.nextGaussian();
  h = h * 10;
  h = h + 100;
  println(ranmoo());
  h =ranmoo()*100;
  fill(0);
  ellipse(width/2,height/2,h,h);
}

float ranmoo() {
  float r1,r2;
  boolean foundone = false;
  int hack = 0;
  while (!foundone && hack < 10000) {
    r1 = (float) random(1);
    r2 = (float) random(1);
    float y = r1* r1;
    if (r2 < y) {
      foundone = true;
      return r1;
    }
    hack++;
  }
  return 0;
}