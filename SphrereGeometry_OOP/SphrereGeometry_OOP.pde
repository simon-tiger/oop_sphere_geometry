import peasy.*;

PeasyCam cam;

//Sphere s;
Ellipsoid s;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  //s = new Sphere(0, 0, 0, 200);
  s = new Ellipsoid(0, 0, 0, 150, 150, 300);
  for (int i = 0; i < s.stroke.length; i++) {
    s.stroke[i] = color(255);
  }
  for (int i = 0; i < s.fill.length; i++) {
    color[] possibilities = {
      color(255,65,54),
      color(255,133,27),
      color(255,220,0),
      color(46,204,64),
      color(0,116,217),
      color(177,13,201)
    };
    int index = int(random(possibilities.length));
    s.fill[i] = possibilities[index];
  }
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  lights();
  s.draw();
}