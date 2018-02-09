import com.hamoid.*;

VideoExport videoExport;
boolean recording = false;

float x;
float y;
void setup(){
  size(800,800);
  //background(121,121,117);
  
  println("Press R to toggle recording");
  videoExport = new VideoExport(this, "interactive.mp4");
  videoExport.startMovie();
}


void draw(){
  float mx = map(mouseX, 0, 800, 30, 170);
  float my = map(mouseY, 0, 800, 30, 230);
  float ax = map(mouseX, 0, 800, 235, 255);
  float ay = map(mouseY, 0, 800, 80, 125);
  noCursor();
  background(ax, 255, ay); //pink 221,21,117 ,, 255,76,68 ,, 245, 255, 100
  //noStroke();
  fill(76,153,221); //yellow 252,242,28
  stroke(255, mx, my);
  strokeWeight(2);
  rect(400,400,100,100);
  fill(76,153,221,200); //yellow 252,242,28,200
  

  pushMatrix();
  rectMode(CENTER);
  x = mouseX;
  y = mouseY;
  
  if(x > 400){
    x = map(x, 0, 800, 800, 0);
    //x = 400-y;
  }else{
  }
  
  if(y > 400){
    y = map(y, 0, 800, 800, 0);
  }else{
  }
  line(400-50,400-50,mouseX-(x/2),mouseY-(y/2));
  line(500-50,400-50,mouseX+(x/2),mouseY-(y/2));
  line(400-50,500-50,mouseX-(x/2),mouseY+(y/2));
  line(500-50,500-50,mouseX+(x/2),mouseY+(y/2));
  
  rect(mouseX,mouseY,x,y);
  popMatrix();
  //println(mouseX+""+mouseY);
  
  if(recording) {
    videoExport.saveFrame();
  }

}

void keyPressed() {
  if(key == 'r' || key == 'R') {
    recording = !recording;
    println("Recording is " + (recording ? "ON" : "OFF"));
  }
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}