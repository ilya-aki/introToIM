// Ilya
// Jun 17

int pushButton = A0;

void setup() {

  Serial.begin(9600);
  pinMode(pushButton, INPUT);
  pinMode(A2, OUTPUT);
  pinMode(A3, OUTPUT);

}

void loop() {

  int buttonState = digitalRead(pushButton);
  int sensorValue = analogRead(A1);

  if (buttonState == HIGH) {
    digitalWrite(A2, HIGH);
    digitalWrite(A3, HIGH);
  }

  if (buttonState == LOW) {
    digitalWrite(A2, LOW);
    digitalWrite(A3, LOW);
  }

  if (sensorValue < 800) {
    digitalWrite(A2, HIGH);
    delay(100);
    digitalWrite(A3, HIGH);
    delay(100);
    digitalWrite(A2, LOW);
    delay(100);
    digitalWrite(A3, LOW);
    delay(100);
  }

  Serial.println(buttonState);
  delay(1);
}
