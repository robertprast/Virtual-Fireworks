import processing.serial.*;



String myString = null;
Serial myPort;
int[] sensorValues = {3};
int star[] = new int[100];
int x = 600; 
int y = 0;


void setup() {
  size(1000, 1000);

  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}
void draw() {
  background(255);
  if (sensorValues[0]==1) {
    String words = "CONGRATULATIONS YOU SET OFF FIREWORKS!!";
    fill(0);
    textSize(45);
    text(words, 0, 70);
    translate(width / 2, height / 2);
    for (int i=0; i<5; i++)
    {
      int temp=y;
      star[i]= y; 
      ellipse(star[i], x, 20, 20);
      ellipse(star[i], x, 15, 15);
      ellipse(star[i], x+20, 10, 10);
      x=x-5;
      if (x == 0 )
      { 
        randomColor();
        pushMatrix();
        star(temp, 0, 80, 100, 10); 
        popMatrix();

        x = 800;
        y = y - (int)random(10, 101);
      }
      if (y<-250) {
        y=200;
      }
    }
  }
  sensorValues[0]=0;
}
void randomColor() {
  {
    delay(1);
    fill(random(0, 255), random(0, 255), random(0, 255));
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
void serialEvent(Serial myPort) {

  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);
    sensorValues[0] = int(inString);
  }
  println(sensorValues[0]);
}