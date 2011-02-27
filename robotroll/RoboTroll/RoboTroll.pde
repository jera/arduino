#define MOTOR_DC_FRENTE 5
#define MOTOR_DC_TRAS 6
#define MOTOR_DC_ESQUERDA 10
#define MOTOR_DC_DIREITA 11

#define SENSOR_FRENTE 0
#define SENSOR_TRAS 2
#define SENSOR_ESQUERDA 1
#define SENSOR_DIREITA 3

int SEM_LUZ_FRENTE = 50;
int SEM_LUZ_OUTROS = 300;

void setup(){
  Serial.begin(9600);
}

void loop()
{
  andar();
}

void andar()
{
 int intensidadeFrente = analogRead(SENSOR_FRENTE);
 int intensidadeTRAS = analogRead(SENSOR_TRAS);
 int intensidadeEsquerda = analogRead(SENSOR_ESQUERDA);
 int intensidadeDireita = analogRead(SENSOR_DIREITA);;
 
 if (intensidadeFrente < SEM_LUZ_FRENTE)
 {
   andarFrente(1000);
 }
 else if (intensidadeTRAS < SEM_LUZ_OUTROS)
 {
   andarTRAS(1000);
 }
 else if (intensidadeEsquerda < SEM_LUZ_OUTROS)
 {
   virarEsquerda(1000);
 }
 else if (intensidadeDireita < SEM_LUZ_OUTROS)
 {
   virarDireita(1000);
 }
 else {
  pararTodosMotores();
 }
}

void virarEsquerda(int tempo)
{
  virar(MOTOR_DC_ESQUERDA,tempo);
  andarFrente(500);
  //alinhar
  virar(MOTOR_DC_DIREITA,500);
}

void virarDireita(int tempo)
{
  virar(MOTOR_DC_DIREITA,tempo);
  andarFrente(500);
  //alinhar
  virar(MOTOR_DC_ESQUERDA,500);
}

void andarFrente(int tempo) 
{ 
  parar(MOTOR_DC_TRAS);
  acelerar(MOTOR_DC_FRENTE,tempo);
}

void andarTRAS(int tempo) 
{ 
  parar(MOTOR_DC_FRENTE);
  acelerar(MOTOR_DC_TRAS,tempo);
}

void virar(int motor, int tempo)
{
  analogWrite(motor,200);
  delay(tempo);
  parar(motor);
}  

void pararTodosMotores()
{
  parar(MOTOR_DC_FRENTE);
  parar(MOTOR_DC_TRAS);
  parar(MOTOR_DC_ESQUERDA);
  parar(MOTOR_DC_DIREITA);
}

void parar(int motor)
{
  analogWrite(motor,0);
}  

void acelerar(int motor, int tempo)
{
  for(int x=100;x<255;x++) 
  { 
    analogWrite(motor, x);
    tempo = tempo - 10;
    delay(20);   
  }
  if (tempo > 0)
  {
      delay(tempo);  
  }  
}

