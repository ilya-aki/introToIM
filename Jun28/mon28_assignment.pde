// Ilya
// Version 3

import processing.serial.*;

String receivedString;
Serial myPort;

void setup() {
  size(500, 500);
  String portname = Serial.list() [1];
  println(portname);
  myPort= new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  background(255);
  circle(mouseX, mouseY, 30);

  //creating the target on the screen
  line(240, 250, 260, 250);
  line(250, 240, 250, 260);

  //checking whether the mouse is close to the horizontal target
  if ((mouseX >= 240) && (mouseX <= 260)) {
    println("mouse is in x scope");

    //checking whether the mouse is close to the vertical target
    if ((mouseY >= 240) && (mouseY <= 260)) {
      println("mouse is in y scope");

      //checking if the mouse is pressed
      if (mousePressed == true) {
        //while the mouse is being pressed, send a signal to Arduino to light up the LED
        println("mouse pressed");
        myPort.write('1');
      } else {
        //if the mouse was not pressed, keep the LED turned off by sending another signal to Arduino
        myPort.write('0');
      }
    }
  }
}
