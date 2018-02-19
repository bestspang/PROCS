import gab.opencv.*;
import processing.video.*;
import java.awt.*;
OpenCV cv;
Capture video;
PVector p1;
PVector p2;
boolean faceDe = true;
boolean isOver;
float x, y,tpX, tpY, m, b, s;
float area = 20;
void setup(){
  size(640,480);//background(121,121,117);
  video = new Capture(this, width/2, height/2);
  cv = new OpenCV(this, width/2, height/2);
  //CASCADE_PEDESTRIANS CASCADE_FULLBODY CASCADE_UPPERBODY
  cv.loadCascade(OpenCV.CASCADE_FRONTALFACE); //CASCADE_FRONTALFACE
  video.start();
  ////////////////////////////////////////////
  p1 = new PVector(random(width),0);// [width/2, 0] , [0, random(height)]
  p2 = new PVector(random(width),height);// [width/2, height] , [width, random(height)]
  PVector sub = PVector.sub(p2, p1);
  // y = mx + b
  m = sub.y / sub.x;
  b = p1.y - m * p1.x;
  s = 0;
  isOver = false;
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
  line(p1.x, p1.y, p2.x, p2.y);
  fill(255);
  text(str(int(s)), 20, 20);
  float faceX = 2*tpX*-1 ,faceY = 2*tpY;
  //println(faceX, faceY);
  //println(mouseX, mouseY);
  //println(m * x + b - area);
  detectIntersect(faceX, faceY, area);
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
  //println(faces.length);
  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    tpX = (faces[i].x-width/2 +faces[i].width/2);//+faces[i].width/2
    tpY = (faces[i].y +faces[i].height/2);//+faces[i].height/2
    rectMode(CENTER);
    rect(tpX, tpY, faces[i].width, faces[i].height);
    //println(gX + "," + tpX + "," + width);
    strokeWeight(1);
    point(tpX, tpY);
  } 
}

void detectIntersect(float x, float y, float area) {
  if ((y > (m * x + b - area)) && (y < (m * x + b + area))) {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
    //print ("Hello!");
    if (isOver == false) {
        s +=1;
        isOver = true;
      }
  }else{
    isOver = false;
  }
}
  
  