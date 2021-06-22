// Ilya
// Musical instrument assignment
// June 22nd


#include "pitches.h"
#include <Servo.h>

Servo myservo;

// notes in the melody:
int melody[] = {
  NOTE_C4, NOTE_CS4, NOTE_D4, NOTE_DS4, NOTE_E4, NOTE_F4, NOTE_FS4, NOTE_G4, NOTE_GS4, NOTE_A4, NOTE_AS4, NOTE_B4
};

//setting up variables for the distance sensor
const int trigPin = 11;
const int echoPin = 12;
float distance = 0;

//setting up variables for the potentiometer and servo
int potpin = A4;
int val;
int pos = 0;


void setup()
{
  Serial.begin (9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  myservo.attach(7);
}


//function for dustance sensor
float getDistance() {
  float echoTime;
  float calculatedDistance;

  //send out an ultrasonic pulse that's 10ms long
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  echoTime = pulseIn(echoPin, HIGH);

  calculatedDistance = echoTime / 148.0;

  return calculatedDistance;
}

void playnote() {
  distance = getDistance();
  //if condition, verifying whether the hand/object is close enough to play a specific note
  if (distance < 2) {
    tone(A3, melody[11]);
  } else if (2 < distance && distance < 3) {
    tone(A3, melody[10]);
  } else if (3 < distance && distance < 4) {
    tone(A3, melody[9]);
  } else if (4 < distance && distance < 5) {
    tone(A3, melody[8]);
  } else if (5 < distance && distance < 6) {
    tone(A3, melody[7]);
  } else if (6 < distance && distance < 7) {
    tone(A3, melody[6]);
  } else if (7 < distance && distance < 8) {
    tone(A3, melody[5]);
  } else if (8 < distance && distance < 9) {
    tone(A3, melody[4]);
  } else if (9 < distance && distance < 10) {
    tone(A3, melody[3]);
  } else if (10 < distance && distance < 11) {
    tone(A3, melody[2]);
  } else if (11 < distance && distance < 12) {
    tone(A3, melody[1]);
  } else if (12 < distance && distance < 13) {
    tone(A3, melody[0]);
  } else {
    noTone(A3);
  }

  //waiting for 150ms  between each read
  delay(150);
}
void loop() {
  playnote();
  
  //using the servo as a metronome where the rhythm is defined by the potentiometer
  val = analogRead(potpin);
  //val = map(val, 0, 1023, 0, 180);
  for (pos = 0; pos <= 180; pos += 60) {
    delay(val / 2);
    myservo.write(pos);
  }
}
