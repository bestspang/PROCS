import com.hamoid.*;
import gab.opencv.*;
import java.awt.*;
import processing.video.*;

Capture video;
OpenCV cv;
VideoExport vExport;
VideoExport videoExport;
/*-----------------Setting--------------------*/

boolean recording = false;
float rectd = 100; //y,x = 100,100
int faceDe = 1;
int widt = 800;
int lengt = 800;

/*--------------------------------------------*/

float x, y, cpX, cpY,tpX, tpY, gX, gY;

void setup(){
  size(800,800);//background(121,121,117);
  
  video = new Capture(this, widt/2, lengt/2);
  cv = new OpenCV(this, widt/2, lengt/2);
  cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  videoExport = new VideoExport(this, "interactive.mp4");
  videoExport.startMovie();
  
  if(faceDe == 1){
    println("face-detection activated!");
  }else{
    println("face-detection deactivated!");
  }
  println("Press R to toggle recording");
  
  video.start();
}


void draw(){
  pushMatrix();
  if(faceDe == 1){
    headDetect();
  }
  
  popMatrix();
  
  float mx = map(mouseX, 0, width, 30, 170);
  float my = map(mouseY, 0, height, 30, 230);
  float ax = map(mouseX, 0, width, 235, 255);
  float ay = map(mouseY, 0, height, 80, 125);
  cpX = (width/2);
  cpY = (height/2);
  noCursor();
  background(255, 255, 255); //pink 221,21,117 ,, ax, 255, ay
  //noStroke();
  fill(76,153,221); //yellow 252,242,28
  stroke(0); //255, mx, my
  strokeWeight(2);
  rect(cpX,cpY,rectd,rectd);
  fill(76,153,221,200); //yellow 252,242,28,200
  

  pushMatrix();
  rectMode(CENTER);
  //x = mouseX;
  //y = mouseY;
  x = gX*-2;
  y = gY*2;
  float x1 = x;
  float y1 = y;
  //println(gX + "," + gY + "," + mouseX + "," + mouseY + ": A");
  //println(x + "," + y + "," + mouseX + "," + mouseY + ": B");
  if(x > width/2){
    x = map(x, 0, width, width, 0);}
  if(y > height/2){
    y = map(y, 0, height, height, 0);}
  line(cpX-rectd/2,cpY-rectd/2,x1-(x/2),y1-(y/2));
  line(cpX+rectd/2,cpY-rectd/2,x1+(x/2),y1-(y/2));
  line(cpX-rectd/2,cpY+rectd/2,x1-(x/2),y1+(y/2));
  line(cpX+rectd/2,cpY+rectd/2,x1+(x/2),y1+(y/2));
  //rect(x1,y1,x/2,y/2);
  rect(x1,y1,x,y);
  popMatrix();
  //println(mouseX+""+mouseY);
  
  if(recording) {
    videoExport.saveFrame();
  }
}

void captureEvent(Capture c) {
  c.read();
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

void headDetect(){
  pushMatrix();
  scale(2);
  scale(-1, 1);
  cv.loadImage(video);
  image(video, -video.width, 0);
  //popMatrix();
  noFill();
  stroke(255);
  strokeWeight(1);
  Rectangle[] faces = cv.detect();
  //println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    tpX = (faces[i].x-width/2)+faces[i].width/2;
    tpY = (faces[i].y)+faces[i].height/2;
    //rect(tpX, tpY, faces[i].width, faces[i].height);
    gX = map(tpX, 0, -width/2, -width/2, 0);
    gY = map(tpY, 0, height/2, height/2, 0);
    //println(gX + "," + tpX + "," + width);
    //ellipse(gX, gY, 1, 1);
  }
  popMatrix();
}