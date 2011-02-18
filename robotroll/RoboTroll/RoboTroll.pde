#define MOTOR_DC_FRENTE 5
#define MOTOR_DC_TRAZ 6
#define MOTOR_DC_ESQUERDA 10
#define MOTOR_DC_DIREITA 11

#define SENSOR_FRENTE 0
#define SENSOR_TRAZ 2
#define SENSOR_ESQUERDA 1
#define SENSOR_DIREITA 3

const int SEM_LUZ_FRENTE = 50;
const int SEM_LUZ_OUTROS = 300;

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
 int intensidadeTraz = analogRead(SENSOR_TRAZ);
 int intensidadeEsquerda = analogRead(SENSOR_ESQUERDA);
 int intensidadeDireita = analogRead(SENSOR_DIREITA);;
 
 Serial.println("");
 Serial.println("Luzes");
 Serial.println(intensidadeFrente);
 Serial.println(intensidadeTraz);
 Serial.println(intensidadeEsquerda);
 Serial.println(intensidadeDireita);
 
// delay(2000);
 
 if (intensidadeFrente < SEM_LUZ_FRENTE)
 {
   andarFrente(1000);
 }
 else if (intensidadeTraz < SEM_LUZ_OUTROS)
 {
   andarTraz(1000);
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
  Serial.println("Motores parados");
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
  parar(MOTOR_DC_TRAZ);
  parar(MOTOR_DC_ESQUERDA);
  parar(MOTOR_DC_DIREITA);
  acelerar(MOTOR_DC_FRENTE,tempo);
}

void andarTraz(int tempo) 
{ 
  parar(MOTOR_DC_FRENTE);
  parar(MOTOR_DC_ESQUERDA);
  parar(MOTOR_DC_DIREITA);
  acelerar(MOTOR_DC_TRAZ,tempo);
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
  parar(MOTOR_DC_TRAZ);
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

