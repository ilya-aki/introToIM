//Setting up the variables

int mY;
int mX;
Ellipses e;

void setup() {
  size(700, 700); 
  e = new Ellipses();
}


void draw() {
  background(172, 174, 150);
  noStroke();

  //Drawing the main shapes, and placing them in the center of the canvas with translate
  pushMatrix();
  translate(width/2, height/2);
  ellipse(-150, 0, 100, 100);
  rect(-50, -50, 100, 100);
  triangle(100, 50, 155, -50, 210, 50);
  popMatrix();
}

void mouseClicked() {
  //Calling the function from the Ellipses class to draw random ellipses
  e.display();
}   
