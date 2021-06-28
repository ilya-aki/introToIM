void setup() {
  Serial.begin(9600);
  pinMode(A0, OUTPUT);
}

void loop() {
  //checking if there is a connection with Processing
  if (Serial.available()) {

    //checking the signal received; if it's 1, light up the LED
    if (Serial.read() == '1') {
      digitalWrite(A0, HIGH);
    } else {    //checking the signal again; if it's 0, keep the LED turned off
      digitalWrite(A0, LOW);
    }
  }
  delay(1);
}
