class PolyShape {
  int POLY_SHAPE_POINT_COUNT;
  int DEFORM_RANGE = 50;
  PVector[] vertices;
  float t = 0.01;
  
  PolyShape(int _count) {
    POLY_SHAPE_POINT_COUNT = _count;
    vertices = new PVector[POLY_SHAPE_POINT_COUNT];
    regen();
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = new PVector(width / 2, height / 2, 0);
    }
  }
 
  void update() {
    for(PVector p : vertices) {
      t += 0.001;
      DEFORM_RANGE = (int)map(noise(t), -1, 1, -20, 20);
      
      fill(map(DEFORM_RANGE, -5, 5, 0, 250));
      
      // p.x += random(-DEFORM_RANGE, DEFORM_RANGE);
      // p.y += random(-DEFORM_RANGE, DEFORM_RANGE);
      // p.z += random(-DEFORM_RANGE, DEFORM_RANGE); 
    }
  }
  
  void display() {
    beginShape(TRIANGLE_STRIP);
      for(PVector p : vertices) {
        vertex(p.x, p.y, p.z); 
      }
    endShape(CLOSE);
  }
  
  void regen() {
    for (int i = 0; i < vertices.length - 1; i++) {
      vertices[i] = vertices[i + 1];
    }
    PVector v = new PVector(width / 2, height / 2, 0);
    if (vertices[vertices.length - 1] != null) {
      v.x = vertices[vertices.length - 1].x + random(-DEFORM_RANGE, DEFORM_RANGE);
      v.y = vertices[vertices.length - 1].y + random(-DEFORM_RANGE, DEFORM_RANGE);
      v.z = vertices[vertices.length - 1].z + random(-DEFORM_RANGE, DEFORM_RANGE);
      
      // Pull toward the center.
      v.x = (v.x - width / 2) * 0.9 + width / 2;
      v.y = (v.y - height / 2) * 0.9 + height / 2;
      v.z = (v.z - 50) * 0.1 + 50;
    }
    vertices[vertices.length - 1] = v;
  }
}
