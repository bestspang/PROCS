Bubble[] bubbles = new Bubble[200];

void setup() {
size(400,800,P2D);
smooth(8);
for (int i = 0; i<bubbles.length; i++) {
bubbles[i] = new Bubble(10+i, -5);
}
}

void draw(){
  background(20);
  for (int i = 0; i<bubbles.length; i++) {
  bubbles[i].ascend();
  bubbles[i].display();
  //bubbles[i].acceleration();
  bubbles[i].collided(i%255);
  //println(i);
  }

  
  if (bubbles[0].overlaps(bubbles[1])){
    //println("overlap!");
  }
  
  //bubbles[1].x = mouseX;
  //bubbles[1].y = mouseY;
  //b2.lineCenter(b);
  //line((b.x+b2.x)/2,(b.y+b2.y)/2,b2.x,b2.y);
}

void mouseClicked(){
  //bubbles[0].pop();
  //bubbles[1].powerup(bubbles[0]);
}