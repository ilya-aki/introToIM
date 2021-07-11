int pushBlueButton = A1;
int pushYellowButton = A2;
int pushRedButton = A3;
int pushGreenButton = A4;


int yellowButtonState = 0;
int redButtonState = 0;
int blueButtonState = 0;
int greenButtonState = 0

void setup() {
  Serial.begin(9600);

  pinMode(pushYellowButton, INPUT);
  pinMode(pushRedButton, INPUT);
  pinMode(pushBlueButton, INPUT);
  pinMode(pushGreenButton, INPUT);

  pinMode(A0, OUTPUT);
}

void loop() {
  int yellowButtonState = digitalRead(pushYellowButton);
  int redButtonState = digitalRead(pushRedButton);
  int blueButtonState = digitalRead(pushBlueButton);
  int greenButtonState = digitalRead(pushGreenButton);

  digitalWrite(A0, LOW);

  //When a bubble gets removed:
  if (Serial.available() > 0) {
    //Turning on the LED as a confirmation:
    digitalWrite(A0, HIGH);
    delay(10);

    //Initiating again each button:
    if (yellowButtonState == HIGH) {
      Serial.print("yellow button_");
    }
    if (redButtonState == HIGH) {
      Serial.print("red button_");
    }
    if (blueButtonState == HIGH) {
      Serial.print("blue button_");
    }
    if (greenButtonState == HIGH) {
      Serial.print("green button_");
    }

    delay(1);

  } else {

    //When the game just started, turn off the LED and
    //check the status of each button:
    digitalWrite(A0, LOW);

    if (yellowButtonState == HIGH) {
      Serial.print("yellow button_");
    }

    if (redButtonState == HIGH) {
      Serial.print("red button_");
    }
    if (blueButtonState == HIGH) {
      Serial.print("blue button_");
    }
    if (greenButtonState == HIGH) {
      Serial.print("green button_");
    }
  }
}
