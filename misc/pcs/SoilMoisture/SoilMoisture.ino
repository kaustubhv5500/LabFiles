
#include "DHT.h"

#define DHTPIN 2     // Digital pin connected to the DHT sensor

#define DHTTYPE DHT11   // DHT 11


#define enA 9 // Pins for motor driver
#define in1 6
//#define in2 7


DHT dht(DHTPIN, DHTTYPE); //Initialize DHT sensor

void setup() {
  Serial.begin(9600);
  Serial.println(F("DHT11 Output Dump!"));
  pinMode(enA,OUTPUT);
  pinMode(in1,OUTPUT); //set the pin as pwm output for controlling the motor
  digitalWrite(in1,LOW); // set the direction of the motor
  dht.begin();
}

void loop() {
  // Wait a few seconds between measurements.
  delay(2000);

  // Reading temperature or humidity takes about 250 milliseconds!
  float h = dht.readHumidity();
  // Read temperature as Celsius (the default)
  float t = dht.readTemperature();
  // Read temperature as Fahrenheit (isFahrenheit = true)
  float f = dht.readTemperature(true);

  // Check if any reads failed and exit early (to try again).
  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }

  // Compute heat index in Fahrenheit (the default)
  float hif = dht.computeHeatIndex(f, h);
  // Compute heat index in Celsius (isFahreheit = false)
  float hic = dht.computeHeatIndex(t, h, false);

  Serial.print(F("Moisture Content: "));
  Serial.print(h);
  Serial.print(F("%  Temperature: "));
  Serial.print(t);
  Serial.print(F("°C "));
  Serial.print(f);
  Serial.print(F("°F  Heat index: "));
  Serial.print(hic);
  Serial.print(F("°C "));
  Serial.print(hif);
  Serial.println(F("°F"));

  //logic to drive the motor to pump water into the soil

  if(h >= 50){
    analogWrite(enA,255);
    digitalWrite(in1,HIGH);
  }
  else{
    analogWrite(enA,0);
    digitalWrite(in1,LOW);
  }
}