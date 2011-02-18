#define QTD_LEDS 9

int porta[QTD_LEDS] = {14,1,2,3,4,5,8,6,13};
int pausa = 500;

void setup() {
  for(int i = 0;i < QTD_LEDS; i++) {
    pinMode(porta[i], OUTPUT);
  }
}

void loop() {
  //Pra cima
  for(int i = 0;i < QTD_LEDS; i++) {
    acendeApagaLed(i);
  }
  //Pra baixo
  for(int i = QTD_LEDS-1; i >= 0; i--) {
     acendeApagaLed(i);
  }
}

void acendeApagaLed(int i)
{
   digitalWrite(porta[i], HIGH);
   delay(pausa);
   digitalWrite(porta[i], LOW);
}  


