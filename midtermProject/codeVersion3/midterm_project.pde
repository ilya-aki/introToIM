
// Ilya
// Midgterm assignment
// Ver 3 - Jun 11th

import processing.sound.*;

SoundFile[] sounds;
final int numberOfSounds = 4;

int timesKeyPressed;
//boolean keyPressed;

void setup() {
  size(1080, 720);
  sounds = new SoundFile[numberOfSounds];
  for (int i = 0; i < numberOfSounds-1; i++) {
    sounds[i] = new SoundFile(this, "keysound" + i + ".mp3");
  }
  println("keysounds loaded");
  //sounds[4] = new SoundFile(this, "soundscape.mp3");
  //println("sound 4 loaded");
}

void draw() {
  circle(100, 100, 100);
}
void keyTyped() {
  //for (int timesKeyPressed = 0; timesKeyPressed < 50; timesKeyPressed = timesKeyPressed + 1) { //50 is the cap -> to change later
  if (timesKeyPressed < 10) {   
    println("key was pressed");
    sounds[0].play();
    println("sound played");
    timesKeyPressed =  timesKeyPressed + 1;
    println(timesKeyPressed);
  }
  if (timesKeyPressed > 10) {
    println("logical AND worked");
    //sounds[2].play();
    //timesKeyPressed =  timesKeyPressed + 1;
    //println(timesKeyPressed);
  }// else {
  //  sounds[4].play();
  //  // play the soundscape
  //}
}
//void keyTyped() {
//  println("key was pressed");
//  sounds[0].play();
//  println("sound played");
//  timesKeyPressed =  timesKeyPressed + 1;
//  println(timesKeyPressed);
//}

//if (keyPressed == true) {

//}

//for (int timesKeyPressed = 0; timesKeyPressed < 500; timesKeyPressed += 1) {
//  println("for loop initiated");
//  sounds[0].play();
//}

//void keyPressed() {
//  sounds[0].play();
//}
