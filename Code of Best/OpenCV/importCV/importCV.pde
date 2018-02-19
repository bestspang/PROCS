import gab.opencv.*;
import processing.video.*;

OpenCV cv;
Capture video;
boolean faceDe = true;

void setup(){
  size(640,480);//background(121,121,117);
  video = new Capture(this, width/2, height/2);
  cv = new OpenCV(this, width/2, height/2);
  //cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void draw(){
  pushMatrix();
  if(faceDe == true){
    scale(2);
    scale(-1, 1);
    cv.loadImage(video);
    image(video, -video.width, 0);
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