#include <SoftwareSerial.h>

const int LED_PIN = 12;
#define TxD 2
#define RxD 3
SoftwareSerial mySerial(RxD, TxD);
char input_data = '0'; 

void setup() {
  // put your setup code here, to run once:
  mySerial.begin(9600); 
  Serial.begin(9600);
  pinMode(LED_PIN,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  if (mySerial.available() > 0){
    input_data = mySerial.read();

    if (input_data == '1'){
      digitalWrite(LED_PIN,HIGH);
      mySerial.print("LED ON");
    }
    else if (input_data == '0'){
      digitalWrite(LED_PIN,LOW);
      mySerial.print("LED OFF");
    }
  }
}
