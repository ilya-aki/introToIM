//Setting up the variables
class Ellipses {
  float x;
  float y;
  int ecounter;

  Ellipses() {
  }
  
  void display() {
    //Limiting the amount of generated ellipses
    while (ecounter < 50) {
      stroke(0);
      fill(0, 0, 255);
      ellipse(random(100), random(100), 10, 10);
      ecounter+=1;
    }
  }
}
