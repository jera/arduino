#define MOTOR_DC_P 12 
#define MOTOR_DC_N 11 
#define MOTOR_DC_PWM 1 
//#define MOTOR2_P 8 
//#define MOTOR2_N 7 
//#define MOTOR2_PWM 6
int sentido = 0; 
void setup(){}

void loop()
{
  andarFrente(1000,50);
  parar(3000);
  andarTras(1000,50);
}

void parar(int tempo)
{
 analogWrite(MOTOR_DC_PWM,0);
 delay(tempo);
}

void andarFrente(int tempo, int intensidade) 
{ 
  analogWrite(MOTOR_DC_PWM,intensidade*50); 
  digitalWrite(MOTOR_DC_P,sentido); 
  digitalWrite(MOTOR_DC_N,!sentido); 
  delay(tempo);
}

void andarTras(int tempo, int intensidade) 
{ 
  analogWrite(MOTOR_DC_PWM,intensidade*50); 
  digitalWrite(MOTOR_DC_P,!sentido); 
  digitalWrite(MOTOR_DC_N,sentido); 
  delay(tempo);
}
