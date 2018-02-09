import java.util.Random;
Random gen;
void setup() {
  size(400,400);
  gen = new Random();
}

void draw() {
  background(255);
  float h = (float) gen.nextGaussian();
  h = h * 10;
  h = h + 100;
  fill(0);
  ellipse(width/2,height/2,h,h);
}