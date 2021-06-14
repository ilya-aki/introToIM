
PFont font;

int x;
int y;

int rectW;
int rectH;

void setup() {
  size(1080, 720);

  x = 200;
  y = 75;

  rectW = 300;
  rectH = 50;

  //homescreen
  background(248, 245, 241);
  pushMatrix();

  noStroke();
  fill(255);
  translate(width/2, height/2);
  rectMode(CENTER);
  rect(-x, y, rectW, rectH, 20, 20, 20, 20);
  rect(x, y, rectW, rectH, 20, 20, 20, 20);

  //text
  fill(0);
  font = loadFont("Helvetica-Bold-100.vlw");
  textFont(font, 50);
  textAlign(CENTER);
  text("Gamify your essay", 0, -25);
  textFont(font, 15);
  text("Create new profile", -x, y+5);
  text("Continue previous project", x, y+5);

  popMatrix();
}

void draw() {
}


void mouseClicked() {
  pushMatrix();
  translate(width/2, height/2);
  println("mouse clicked not in right place");

  //page switch if left button pressed
  if ((mouseX >= -x) && (mouseX <= -x+rectW)) {
    println("mouse detected on x");
    if ((mouseY >= y) && (mouseY <= y-rectH)) {
      background(0);
      //call the function for the profile setup
    }
  }
  popMatrix();
}
