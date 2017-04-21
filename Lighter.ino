int sensorPin = 0;
void setup()
{
  Serial.begin(9600);
}
void loop()
{
  int reading = analogRead(sensorPin);
  if (reading > 70) {
   // for (int i = 0; i < 100; i++) {
      Serial.println(1);
   // }
  }
  else {
    Serial.println(0);
  }
  delay(1);                                     
}
