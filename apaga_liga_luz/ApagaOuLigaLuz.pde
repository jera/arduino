void setup() { 
  //Inicializando conexão com PC via FT232 - cabo 
  Serial.begin(9600);
  //Porta 13 em output
  pinMode(13, OUTPUT);
}
void loop() { 
  //LDR ligado na 5 //envia informações para o PC 
  int luz = analogRead(5); 
  if (luz < 600)
  {
    Serial.println("Apaga Luz");
    digitalWrite(13, LOW);
  }
  else{
    Serial.println("Liga Luz");
    digitalWrite(13, HIGH);
  }
  delay(500);
}


