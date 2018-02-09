import java.util.Random;
Random gen;

void setup() {
  size(800,200);
  background(255);
  gen = new Random();
  smooth(8);
}

void draw() {
  //background(255,20);
  float xloc = (float) gen.nextGaussian();
  float sd = 60;
  float mean = width/2;
  xloc = (xloc * sd) + mean;
  noStroke();
  fill(0,10);
  stroke(20,20);
  //ellipse(xloc,height/2,16,16);
  line(xloc,0+75,xloc,height-75);
  
}