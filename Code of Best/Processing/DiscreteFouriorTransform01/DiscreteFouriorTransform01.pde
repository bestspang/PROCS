
void setup() {
  size(400,400);
  background(255);
}

void draw() {
  line(0,random(height),width,random(height));
}


void dft(float time) {
  ArrayList ret = new ArrayList();
  float n = time.length;
  for (int i = 0 ; i < n ; ++i) {
    float sreal = 0, simag = 0, angle = 0;
    for (int j = 0 ; j < n ; ++j) {
      angle = tpi * i * j / n; // tpi = 2*Math.PI
      sreal +=  time[j][0] * Math.cos(angle) + time[j][1] * Math.sin(angle);
      simag += -time[j][0] * Math.sin(angle) + time[j][1] * Math.cos(angle);
    }
    ret.push([sreal/n,simag/n,i]);
  }
  return ret
}