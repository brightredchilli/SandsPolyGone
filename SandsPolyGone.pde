boolean redrawShape = false;
float xPos, yPos;
PVector xCenter, yCenter;
PolyShape shape;
int refresh;
int ticker;
color colors[]; //Array of possible colors to cycle through
int numColors=2;
int curColorIndex=0; //Track the current fill color


void setup() {
  size(700, 394, OPENGL);
  stroke(0, 100);
  fill(30, 100);
  stroke(0, 0, 200);
  strokeWeight(2);
  refresh = 30;
  ticker = 0;
  colors = new color[numColors];
  colors[0] = color(100, 200, 300);
  colors[1] = color(200,300,100);
  
  shape = new PolyShape(5);
  smooth();
  background(0);
}

void doSomething() {
  //cycle through the color array
  curColorIndex = ++curColorIndex % numColors;
  
}

void changeSomething(float x, float y) {
  refresh = (int)(x * 30);

//  if(y something something something) {
//    something 
//  }

}

void triangoRecursoLeft(int y) {
  if (y > height) {
    return;
  } else {
    beginShape();
    vertex(0, y);
    vertex(30, y+30);
    vertex(0, y+60);
    vertex(0, y);
    endShape();
    triangoRecursoLeft(y+60);
  }
}
void triangoRecursoRight(int y) {
  if (y > 2*height) {
    return;
  } else {
    beginShape();
    vertex(width, y);
    vertex(width-30, y+30);
    vertex(width, y+60);
    vertex(width, y);
    endShape();
    triangoRecursoRight(y+60);
  }
}


void draw() {
  lights();
  ticker++;
  if (ticker >= refresh) {
    shape.regen();
    ticker = 0;
  } else {
    int y = frameCount % height;
    pushStyle();
    fill(255, 0, 0);
    triangoRecursoLeft(y-height);
    triangoRecursoRight(y-height);
    
    popStyle();
    
  }

  
  fill(colors[curColorIndex]);
  stroke(colors[curColorIndex]);
  
  shape.update();
  shape.display();
}

void mouseMoved() {
  changeSomething(PApplet.map(mouseX, 0, width, 0, 1), PApplet.map(mouseY, 0, height, 0, 1));
}

void keyPressed() {
  doSomething(); 
}
