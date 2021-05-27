//Ilya
//Assignment 2
//27/05/2021

//Setting up the variables
float x;
int y;
float i;

//Other setups
void setup() {
  size(800, 800);
  background(187, 178, 166);
  x = 10;
  y = 100;
  i = 5;
}


void draw() {
  
  //Black vertical circles 
  while (x <= 700) {
    x = x + 80;
    noFill();
    circle(400, 400 + x, x);
    circle(400, 400 - x, x);
  }
  
  //Resetting the value of x to reuse it for another design
  x = 10;
  
  //White horizontal circles
  while (x <= 700) {
    x = x + 160;
    noFill();
    circle(400 + x, 400, x-160);
    circle(400 - x, 400, x-160);
    arc(400 - x, 400 - x, x, x, radians(270), radians(90));
  }
  
  //Diagonal dots
  for (int i = 5; i <= 800; i = i + 5) {
    strokeWeight(2);
    stroke(255, 255, 255);
    point (400 + i, 400 - i);
    point (400 - i, 400 - i);
  }
  
  //Diagonal lines
  strokeWeight(1);
  line(0, 800, 400, 400);
  line(400, 400, 800, 800);
  
}
