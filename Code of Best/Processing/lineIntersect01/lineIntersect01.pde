PVector p1;
PVector p2;
float m;
float b;
int s;
int area = 10;
boolean isOver;
void setup() {
  size(800, 800);
  p1 = new PVector(0, random(height));
  p2 = new PVector(width, random(height));
  PVector sub = PVector.sub(p2, p1);
  // y = mx + b
  m = sub.y / sub.x;
  b = p1.y - m * p1.x;
  s = 0;
  isOver = false;
  cursor(CROSS);
}

void draw() {
  background(255);
  stroke(0);
  fill(0);
  text(str(s), 20, 20);
  line(p1.x, p1.y, p2.x, p2.y);
  fill(255);
  if ((mouseY > (m * mouseX + b - area)) && (mouseY < (m * mouseX + b + area))) {
    noStroke();
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 20, 20);
    if (isOver == false) {
        s +=1;
        isOver = true;
      }
  }else{
    isOver = false;
  }
}