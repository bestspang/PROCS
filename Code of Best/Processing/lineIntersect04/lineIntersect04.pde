PVector p;
float x0, y0, radius;
 
void setup() {
  size(400, 400);
  x0 = random(100, 300);
  y0 = random(100, 300);
  radius = random(50, 100);
  p = new PVector(random(400), random(400));
  cursor(CROSS);
}
 
void draw() {
  background(255);
  fill(255);
 
  PVector mouse = new PVector(mouseX, mouseY);
  ellipse(x0, y0, 2 * radius, 2 * radius);
  line(p.x, p.y, mouse.x, mouse.y);
  ellipse(p.x, p.y, 10, 10);
  PVector sub = PVector.sub(mouse, p);
  // y = a * x + b
  float a = sub.y / sub.x;
  float b = p.y - a * p.x;
  // (x - x0)^2 + (y - y0)^2 = radius ^2
  // y = a * x + b
  float A = (1 + a * a);
  float B = (2 * a *( b - y0) - 2 * x0);
  float C = (x0 * x0 + (b - y0) * (b - y0)) - (radius * radius);
  float delta = B * B - 4 * A * C;
  //println(delta);
  if (delta >= 0) {
    fill(255, 0, 0);
    float x1 = (-B - sqrt(delta)) / (2 * A);
    float y1 = a * x1 + b;
    if ((x1 > min(p.x, mouse.x)) && (x1 < max(p.x, mouse.x)) && (y1 > min(p.y, mouse.y)) && (y1 < max(p.y, mouse.y))) {
      ellipse(x1, y1, 20, 20);
    }
    float x2 = (-B + sqrt(delta)) / (2 * A);
    float y2 = a * x2 + b;
    if ((x2 > min(p.x, mouse.x)) && (x2 < max(p.x, mouse.x)) && (y2 > min(p.y, mouse.y)) && (y2 < max(p.y, mouse.y))) {
      ellipse(x2, y2, 20, 20);
    }
  }
}