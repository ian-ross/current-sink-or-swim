void setup() {
  pinMode(0, OUTPUT);
  analogWriteFrequency(0, 100000);
}

void loop() {
  analogWrite(0, 64);
}
