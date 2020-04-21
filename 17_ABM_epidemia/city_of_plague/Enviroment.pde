// "environment" czyli mapa środowiska życia agentów
///////////////////////////////////////////////////////////

//enum EnvTile {FLAT=0,WORK,ROAD,REST}//To enum w Processingu jest obiektem co jest bez sensu!

//Environment "tiles"
final int Env_FLAT=0;
final int Env_WORK=100;
final int Env_SHOP=120;
final int Env_ROAD=200;
final int Env_REST=300;

void initializeEnv(int[][] env)
{
  street(env,0,env.length);//Ulice są poziome
  avenue(env,0,env[0].length);//Aleje są pionowe
  println(streetcount,avenuecount);
}

float limit=1;
float fcars=0.05;
int   streetcount=0;
int   avenuecount=0;

void fillblock(int[][] env,int val,int a1,int b1,int a2,int b2)
{
  for(int a=a1;a<a2;a++)
  for(int b=b1;b<b2;b++)
     env[b][a]=val;
}

void avenue(int[][] env,float start,float end)
{
  float len=end-start;//Szerokość pasa zabudowy
  float weight=len*fcars;//Szerokość alei
  if(weight<limit) return;//Czy nie za wąska dla samochodu?
  avenuecount++;//Zliczenie
  
  float center=(start+end)/2;
  
  fillblock(env,Env_ROAD,int(center-weight/2),0,int(center+weight/2),env.length);//Aleje są pionowe
  
  avenue(env,start,center-weight/2);
  avenue(env,center+weight/2,end);
}

void street(int[][] env,float start,float end)
{
  float len=end-start;//Szerokość pasa zabudowy
  float weight=len*fcars;//Szerokość ulicy
  if(weight<limit) return;//Czy nie za wąska dla samochodu?
  streetcount++;//Zliczenie
  
  float center=(start+end)/2;
  
  fillblock(env,Env_ROAD,0,int(center-weight/2),env[0].length,int(center+weight/2));//Ulice są poziome
  
  street(env,start,center-weight/2);
  street(env,center+weight/2,end);
}
