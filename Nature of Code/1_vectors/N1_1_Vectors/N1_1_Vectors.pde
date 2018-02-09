PVector loc, velo;
float sz = 40;


void setup() {
  size(600,600);
  background(0);
  smooth(20);
  loc = new PVector(width/2, height/2);
  velo  = new PVector(-5, 2);

}
void draw() {
  loc.add(velo);
  background(0);
  ellipse(loc.x,loc.y,sz,sz);
 if (loc.x>width-sz/2 || loc.x<0+sz/2) {
   velo.x*=-1;
   //println("X",sx,ax,x);
 }if (loc.y>height-sz/2 || loc.y<0+sz/2){
   velo.y*=-1;
   //println("Y",sy,ay,y);
 }
}