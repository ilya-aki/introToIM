
int totalNumBubbles;    //variable in which the random number of bubbles will be stored
ArrayList <Bubble> bubbles;

color [] colors = new color[4];
int c;

int lineY;    //variable for the invisible line, allowing bubbles to fall one at a time

import processing.serial.*;
String receivedString;
Serial myPort;
String buttonState = "";

PImage home_screen;
PImage instructions_screen;
int screen;

void setup() {
  size(600, 600);

  colors[0] = color(197, 102, 88);  //#FF0000; //red
  colors[1] = color(137, 159, 195);  //#0000FF; //blue
  colors[2] = color(159, 182, 118);  //#008080; //green
  colors[3] = color(226, 197, 100);  //#FFFF00; //yellow

  lineY = 100;

  bubbles = new ArrayList <Bubble>();
  totalNumBubbles = int(random(10, 20));    //storing the randomized number of slots in the list
  for (int i = 0; i < totalNumBubbles; i +=1) {    //fill each slot in the list with the bubble object
    c = int(random(0, 4));
    bubbles.add(new Bubble(64, colors[c]));
  }

  String portname = Serial.list() [1];
  println(portname);
  myPort= new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('_');

  home_screen = loadImage("home_screen.jpg");
  instructions_screen = loadImage("instructions_screen.jpg");
  screen = 0;
}

void serialEvent (Serial myPort) {
  
  buttonState = myPort.readStringUntil('_');

  //trimming the receiving message from Arduino
  String s = myPort.readStringUntil('_'); 
  s = trim(s);
  if (s!=null) {
    String values[] = (split(s, '_'));
    if (values.length>1) {
      buttonState = values[0];
    }
  }
}

void draw() {

  //Setting up the home screen:
  
  if (screen == 0) {
    image(home_screen, 0, 0);
  } else {
    background(238, 232, 222);
    noStroke();
    line(0, 50, 600, 50);


    //Initiating the bubbles:

    for (int i = 1; i < bubbles.size(); i +=1) {

      //Creating variables:
      Bubble b = bubbles.get(i);
      Bubble prev_b = bubbles.get(i-1);

      //Initiating a first bubble to fall (to avoid having all bubbles fall at the same time):
      if (i == 1) {
        b.ascend();
        b.display();
      }

      //Checking if the previous bubble has crossed the invisibe line: if so, make another bubble fall
      if (prev_b.y >= lineY) {
        b.ascend();
        b.display();
      }

      //Discarding bubbles that have left the canvas:
      if (b.y == height) {
        bubbles.remove(i);
      }


      //Removing the bubbles with Arduino buttons:
      
      //YELLOW
      // 1 - checking whether the bubble is in the canvas:
      if (b.y >= 1) {
        if (b.y <= height) {

          // 2 - checking which colored button has been pressed:
          if (buttonState.equals("yellow button_")) {
            //println("yellow button pressed");

            // 3 - checking if the color of the button corresponds to the color of the bubble
            if (b.c == -1915548) {      

              // 4 - removing the bubble:
              bubbles.remove(i); 
              println("bubble removed"); 

              // 5 - sending confirmation receipt to Arduino:
              myPort.write('1'); 
              myPort.clear();
            }
          }
        }
      }
      
      //RED
      // 1 - checking whether the bubble is in the canvas:
      if (b.y >= 1) {
        if (b.y <= height) {

          // 2 - checking which colored button has been pressed:
          if (buttonState.equals("red button_")) {
            //println("yellow button pressed");

            // 3 - checking if the color of the button corresponds to the color of the bubble
            if (b.c == -3840424) {      

              // 4 - removing the bubble:
              bubbles.remove(i); 
              println("bubble removed"); 

              // 5 - sending confirmation receipt to Arduino:
              myPort.write('1'); 
              myPort.clear();
            }
          }
        }
      }
      
      //GREEN
      // 1 - checking whether the bubble is in the canvas:
      if (b.y >= 1) {
        if (b.y <= height) {

          // 2 - checking which colored button has been pressed:
          if (buttonState.equals("green button_")) {
            //println("yellow button pressed");

            // 3 - checking if the color of the button corresponds to the color of the bubble
            if (b.c == -6310282) {      

              // 4 - removing the bubble:
              bubbles.remove(i); 
              println("bubble removed"); 

              // 5 - sending confirmation receipt to Arduino:
              myPort.write('1'); 
              myPort.clear();
            }
          }
        }
      }
      
      //BLUE
      // 1 - checking whether the bubble is in the canvas:
      if (b.y >= 1) {
        if (b.y <= height) {

          // 2 - checking which colored button has been pressed:
          if (buttonState.equals("blue button_")) {
            //println("yellow button pressed");

            // 3 - checking if the color of the button corresponds to the color of the bubble
            if (b.c == -7757885) {      

              // 4 - removing the bubble:
              bubbles.remove(i); 
              println("bubble removed"); 

              // 5 - sending confirmation receipt to Arduino:
              myPort.write('1'); 
              myPort.clear();
            }
          }
        }
      }
    }
  }
}

//mouse tracking to allow the homescreen to work
void mouseClicked() {
  println("mouse clicked"); 
  screen = 1;
}
