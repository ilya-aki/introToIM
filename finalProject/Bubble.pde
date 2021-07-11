class Bubble {

  float x;
  int y;
  float diameter;
  int yspeed;

  color c;  
  int mouse;

  Bubble(float tempD, color _c) {
    x = random(width);
    y = 0;
    diameter = tempD;
    yspeed = int(random(1, 3));
    c = _c;
    //mouse = _mouse;
  }

  void ascend() {
    y = y + yspeed;
    //x = x + random(-2, 2);
    //println(y);
  }
  void display() {
    fill(c);
    //println(c);
    ellipse(x, y, diameter, diameter);
  }

}
