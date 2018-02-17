PVector p1;
PVector p2;
PVector p3;
float a;
float b;
 
void setup() {
  size(400, 400);
  p1 = new PVector(0, random(200));
  p2 = new PVector(width, random(0, 400));
  p3 = new PVector(random(400), random(400));
  PVector sub = PVector.sub(p2, p1);
  // y = a * x + b
  a = sub.y / sub.x;
  b = p1.y - a * p1.x;
  cursor(CROSS);
}
 
void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p3.x, p3.y, mouse.x, mouse.y);
  fill(255);
  PVector sub1 = PVector.sub(mouse, p3);
  float a1 = sub1.y / sub1.x;
  float b1 = p3.y - a1 * p3.x;
 
  float x = (b1 - b) / (a - a1);
  float y = a * x + b;
 
  if ((x > min(p1.x, p2.x)) && (x < max(p1.x, p2.x)) && (y > min(p1.y, p2.y)) && (y < max(p1.y, p2.y))
    && (x > min(p3.x, mouse.x)) && (x < max(p3.x, mouse.x)) && (y > min(p3.y, mouse.y)) && (y < max(p3.y, mouse.y))) {
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
  }
}