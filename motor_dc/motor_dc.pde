#define MOTOR_DC_FRENTE 5
#define MOTOR_DC_TRAZ 6
#define MOTOR_DC_ESQUERDA 10
#define MOTOR_DC_DIREITA 11

#define SENSOR_FRENTE 0
#define SENSOR_TRAZ 1
#define SENSOR_ESQUERDA 2
#define SENSOR_DIREITA 3

int SEM_LUZ_FRENTE = 200;
int SEM_LUZ_OUTROS = 500;

void setup(){
  Serial.begin(9600);
}

void loop()
{
//  andar();
   andarFrente(3000,5);
   virarEsquerda(2000);
   andarTraz(4000,5);
   virarDireita(2000);
}


void andar()
{
 int intensidadeFrente = analogRead(SENSOR_FRENTE);
 int intensidadeTraz = analogRead(SENSOR_TRAZ);
 int intensidadeEsquerda = analogRead(SENSOR_ESQUERDA);
 int intensidadeDireita = 0;
 
 Serial.println("");
 Serial.println("Luzes");
 Serial.println(intensidadeFrente);
 Serial.println(intensidadeTraz);
 Serial.println(intensidadeEsquerda);
// Serial.println("traz "+intensidadeTraz);
// Serial.println("esquerda "+intensidadeEsquerda);
// Serial.println("direita "+intensidadeDireita);
 
 delay(2000);
 
 if (intensidadeFrente > SEM_LUZ_FRENTE)
 {
   andarFrente(1000,5);
 }
 else if (intensidadeTraz > SEM_LUZ_OUTROS)
 {
   andarTraz(1000,5);
 }
 else if (intensidadeEsquerda > SEM_LUZ_OUTROS)
 {
   virarEsquerda(1000);
 }
 else if (intensidadeDireita > SEM_LUZ_OUTROS)
 {
   virarDireita(1000);
 }
 else {
  Serial.println("Motores parados");
  pararTodosMotores();
 }
}

void vaiBater()
{
  int luz = analogRead(0);
  Serial.println(luz);
  delay(500);
  
}

void virarEsquerda(int tempo)
{
  virar(MOTOR_DC_ESQUERDA,tempo);
  andarFrente(1000,5);
  //alinhar
  virar(MOTOR_DC_DIREITA,500);
}

void virarDireita(int tempo)
{
  virar(MOTOR_DC_DIREITA,tempo);
  andarFrente(1000,5);
  //alinhar
  virar(MOTOR_DC_ESQUERDA,500);
}

void virar(int motor, int tempo)
{
  analogWrite(motor,100);
  delay(tempo);
  parar(motor);
}  

void andarFrente(int tempo, int marcha) 
{ 
  acelerar(MOTOR_DC_FRENTE,marcha,tempo);
  parar(MOTOR_DC_FRENTE);
}

void andarTraz(int tempo, int marcha) 
{ 
  acelerar(MOTOR_DC_TRAZ,marcha,tempo);
  parar(MOTOR_DC_TRAZ);
}

void pararTodosMotores()
{
  analogWrite(MOTOR_DC_FRENTE,0);
  analogWrite(MOTOR_DC_TRAZ,0);
  analogWrite(MOTOR_DC_ESQUERDA,0);
  analogWrite(MOTOR_DC_DIREITA,0);
}

void parar(int motor)
{
  analogWrite(motor,0);
  delay(1000);
}  

void acelerar(int motor, int marcha, int tempo)
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

