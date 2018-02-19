import gab.opencv.*;
import processing.video.*;
import java.awt.*;
OpenCV cv;
Capture video;
boolean faceDe = true;
float x, y, cpX, cpY,tpX, tpY, gX, gY;
void setup(){
  size(640,480);//background(121,121,117);
  video = new Capture(this, width/2, height/2);
  cv = new OpenCV(this, width/2, height/2);
  cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void draw(){
  pushMatrix();
  if(faceDe == true){
    scale(2);
    scale(-1, 1);
    cv.loadImage(video);
    image(video, -video.width, 0);
    headDetect();
  }
  popMatrix();
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
}

void captureEvent(Capture c) {
  c.read();
}

void headDetect() {
  noFill();
  stroke(255);
  strokeWeight(1);
  Rectangle[] faces = cv.detect();
  //println(faces);
  println(faces.length);
  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    tpX = (faces[i].x-width/2)+faces[i].width/2;
    tpY = (faces[i].y)+faces[i].height/2;
    rect(tpX, tpY, faces[i].width, faces[i].height);
    gX = map(tpX, 0, -width/2, -width/2, 0);
    gY = map(tpY, 0, height/2, height/2, 0);
    //println(gX + "," + tpX + "," + width);
    //ellipse(gX, gY, 1, 1);
  }
}