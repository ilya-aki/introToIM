
// Ilya
// Midgterm assignment
// Ver 2 - Jun 10th

import processing.sound.*;

SoundFile[] sounds;
final int numberOfSounds = 3;


void setup() {
  size(1080, 720);
  sounds = new SoundFile[numberOfSounds];
  for (int i = 0; i < numberOfSounds; i++) {
    sounds[i] = new SoundFile(this, "keysound" + i + ".mp3");
  }
}

void draw() {
  circle(100, 100, 100);
}

void keyPressed() {
  int songToPlay = (int) random(numberOfSounds);
  sounds[songToPlay].play();
}
