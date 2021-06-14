
// Ilya
// Midgterm assignment


//Setting up the variables
PFont font;

import processing.sound.*;

//creating a class for the sounds used
SoundFile[] sounds;
final int numberOfSounds = 4;
SoundFile currentSong;

//variable storing the number of keys pressed
int timesKeyPressed;

//variabels used to keep track of the ratio between time and the number of keys pressed
//this is used to check if the user is typing actively or not. Depending on the outcome
//the soundscape will either continue (this way, rewarding the user for the hard work), or stop
//as to remind the user to keep on typing more.
int timeSoundscapeStarted;
int stopTime;
int timeElapsed;
int keysCheck; 

void setup() {
  size(1080, 720);
  
  //loading sounds
  sounds = new SoundFile[numberOfSounds];
  for (int i = 0; i < numberOfSounds; i++) {
    sounds[i] = new SoundFile(this, "keysound" + i + ".mp3");
  }
  println("keysounds loaded");
  currentSong = sounds[3];
}

void draw() {
  
  //printing the instructions
  fill(0);
  font = loadFont("Helvetica-Bold-100.vlw");
  textFont(font, 25);
  textAlign(LEFT);
  text("As you start typing, you will hear sounds.", 100, 350);
  text("If you type consistently enough, a soundscape will begin to keep you focused.", 100, 375);
  
}
void keyTyped() {
  
  //first sounds when the user just starts to type
  if (timesKeyPressed < 20) {   
    println("key was pressed");
    sounds[0].play();
    println("sound played");
    timesKeyPressed =  timesKeyPressed + 1;
    println(timesKeyPressed);
  }
  
  //sound signifying that the user has typed enough for the soundscape to start
  if (timesKeyPressed == 20) {
    sounds[2].play();
    timesKeyPressed =  timesKeyPressed + 1;
  }
  
  //starting the soundscape
  if (timesKeyPressed > 20) {
    timesKeyPressed =  timesKeyPressed + 1;
    println(timesKeyPressed);
    
    //verifying if the soundscape is not playing already
    if (sounds[3].isPlaying() == false) {
      sounds[3].play();
      timeSoundscapeStarted = millis(); //using this variable to keep track of when the soundscape started playing
      println("soundscape is set to play");
    } else {
      println("soundscape is already playing");
    }
  }

   
  timeElapsed = millis() - timeSoundscapeStarted;
  
  //calculating whether a minute (or 60000 millis) have pased by
  if (timeElapsed % 60 == 0) {
    println("seems like a minute has passed by");
    if (timesKeyPressed < 50) {
      sounds[3].stop();
    }
  }
}
