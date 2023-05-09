import processing.serial.*;
int diametro = 50;

Serial serial;

void setup() {
  size(800,800);
  serial = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  frameRate(60);
  background(255);
  //ellipse(width/2, height/2, diametro, diametro);
  
  if (serial.available() > 0) {
    String message = serial.readStringUntil(10);
    if (message != null) {
      int sensorValue = int(message.trim());
      println(sensorValue);
      fill(0);
      text(sensorValue,0,0);
      diametro = sensorValue/2;
      if(sensorValue>265){
      star(width/2, height/2,50,diametro,diametro/10);
  }
    }
  }  
  
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
