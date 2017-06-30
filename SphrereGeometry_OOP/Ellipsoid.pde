class Ellipsoid {
  float x;
  float y;
  float z;
  float a;
  float b;
  float c;
  int detail;
  color[] stroke;
  color[] fill;
  
  Ellipsoid(float x, float y, float z, float a, float b, float c) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.a = a;
    this.b = b;
    this.c = c;
    detail = int(b/2);
    stroke = new color[detail];
    fill = new color[detail];
  }
  
  PVector[][] computeVertices() {
    PVector[][] vertices = new PVector[detail+1][detail+1];
    for (int j = 0; j <= detail; j++) {
      float lat = map(j, 0, detail, 0, PI);
      for (int i = 0; i <= detail; i++) {
        float lon = map(i, 0, detail, 0, TWO_PI);
        float x = a * sin(lat) * cos(lon);
        float y = b * sin(lat) * sin(lon);
        float z = c * cos(lat);
        vertices[j][i] = new PVector(x, y, z);
      }
    }
    return vertices;
  }
  
  void draw() {
    pushMatrix();
    translate(x, y, z);
    PVector[][] vertices = computeVertices();
    for (int j = 0; j < detail; j++) {
      stroke(stroke[j]);
      fill(fill[j]);
      beginShape(TRIANGLE_STRIP);
      for (int i = 0; i <= detail; i++) {
        PVector v1 = vertices[i][j];
        vertex(v1.x, v1.y, v1.z);
        PVector v2 = vertices[i][j+1];
        vertex(v2.x, v2.y, v2.z);
      }
      endShape();
    }
    popMatrix();
  }
}