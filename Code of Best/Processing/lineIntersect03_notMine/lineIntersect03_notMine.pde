/**
Determines whether a point'c' is close to a line from
'a' to 'b' <br>
If the point is close enough then the point haloe will be green else it is red. <br>
It works by calculating the point nearest point (pj)  on the line to the point 'c'.
It then determoines whether 'pj' is inside the line segment a-->b and that the dist
c<>pj is less than a closeness value.
*/
 
PVector a, b, c, pj;
float closeness = 1;
int t;
public void setup() {
  size(400, 400);
  // cursor(cross);
  a = new PVector(121, 87);
  b = new PVector(299, 322);
  c = new PVector(160, 410);
  pj = new PVector();
}
 
public void draw() {
  background(255);
  // Offset the cursor so we can see what is happening
  c. set(mouseX - 20, mouseY - 20);
  // Is c on the line a --> b
  // pj is the nearest point on the line
  boolean ol = isOnLine(a, b, c, pj);
 
  noFill();
  stroke(160);
  strokeWeight(1.1);
  line(a.x, a.y, pj.x, pj.y);
  line(c.x, c.y, pj.x, pj.y);
  stroke(0);
  strokeWeight(1.5);
  line(a.x, a.y, b.x, b.y);
  noStroke();
  ellipse(a.x, a.y, 4, 4);
  ellipse(b.x, b.y, 4, 4);
  text(str(t),20,20);
  // Point halo
  if (ol){
    t += 1;
    fill(0, 255, 0, 64);}
  else
    fill(255, 0, 0, 64);
  ellipse(c.x, c.y, 20, 20);
  // Point
  fill(0);
  ellipse(c.x, c.y, 4, 4);
}
 
boolean isOnLine(PVector v0, PVector v1, PVector p, PVector vp) {
  // Return minimum distance between line segment vw and point p
  PVector line = PVector.sub(v1, v0);
  float l2 = line.magSq();  // i.e. |w-v|^2 -  avoid a sqrt
  if (l2 == 0.0) {
    vp.set(v0);
    return false;
  }
  PVector pv0_line = PVector.sub(p, v0);
  float t = pv0_line.dot(line)/l2;
  pv0_line.normalize();
  vp.set(line);
  vp.mult(t);
  vp.add(v0);
  float d = PVector.dist(p, vp);
  if (t >= 0 && t <= 1 && d <= closeness)
    return true;
  else
    return false;
}